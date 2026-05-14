$content = Get-Content 'about-us.html' -Raw

$newBlock = @'
<!-- Core Values Section -->
                            <div class="row mt-60 mb-0">
                                <div class="col-12 text-center mb-50">
                                    <span style="display:inline-block;font-size:10px;font-weight:800;letter-spacing:4px;color:#D4AF37;text-transform:uppercase;margin-bottom:12px;">What We Stand For</span>
                                    <h2 class="section-title style-two fw-semibold" style="margin-bottom:0;">Our Core Values</h2>
                                    <div style="width:48px;height:2px;background:#D4AF37;border-radius:2px;margin:18px auto 0;"></div>
                                </div>
                            </div>
                            <div class="row justify-content-center pb-60">
                                <div class="col-xl-9 col-lg-10">

                                    <!-- Value 1 -->
                                    <div data-cue="slideInUp" data-delay="100"
                                         style="display:grid;grid-template-columns:70px 1fr;gap:32px;align-items:start;padding:30px 0;border-bottom:1px solid rgba(0,37,44,0.07);">
                                        <div style="text-align:center;padding-top:2px;">
                                            <span style="font-size:44px;font-weight:900;color:rgba(0,37,44,0.08);line-height:1;display:block;font-family:Georgia,serif;">01</span>
                                        </div>
                                        <div>
                                            <h4 style="font-size:16px;font-weight:700;color:#00252C;margin:0 0 10px;">Accuracy First</h4>
                                            <p style="font-size:13.5px;color:#6b7280;line-height:1.8;margin:0;">Every number verified by ICAI-registered Chartered Accountants. Zero tolerance for errors across every filing, report, audit, and financial statement &mdash; precision you can stake your business on.</p>
                                        </div>
                                    </div>

                                    <!-- Value 2 -->
                                    <div data-cue="slideInUp" data-delay="200"
                                         style="display:grid;grid-template-columns:70px 1fr;gap:32px;align-items:start;padding:30px 0;border-bottom:1px solid rgba(0,37,44,0.07);">
                                        <div style="text-align:center;padding-top:2px;">
                                            <span style="font-size:44px;font-weight:900;color:rgba(0,37,44,0.08);line-height:1;display:block;font-family:Georgia,serif;">02</span>
                                        </div>
                                        <div>
                                            <h4 style="font-size:16px;font-weight:700;color:#00252C;margin:0 0 10px;">Full Transparency</h4>
                                            <p style="font-size:13.5px;color:#6b7280;line-height:1.8;margin:0;">Clear pricing, honest timelines, and regular financial updates. You always know exactly where your accounts stand &mdash; no hidden charges, no ambiguity, and no surprises at any stage.</p>
                                        </div>
                                    </div>

                                    <!-- Value 3 -->
                                    <div data-cue="slideInUp" data-delay="300"
                                         style="display:grid;grid-template-columns:70px 1fr;gap:32px;align-items:start;padding:30px 0;">
                                        <div style="text-align:center;padding-top:2px;">
                                            <span style="font-size:44px;font-weight:900;color:rgba(0,37,44,0.08);line-height:1;display:block;font-family:Georgia,serif;">03</span>
                                        </div>
                                        <div>
                                            <h4 style="font-size:16px;font-weight:700;color:#00252C;margin:0 0 10px;">Growth-Oriented Advisory</h4>
                                            <p style="font-size:13.5px;color:#6b7280;line-height:1.8;margin:0;">Beyond compliance &mdash; proactive strategic advisory, structured MIS dashboards, and intelligent tax planning designed to help your business scale with confidence and financial clarity.</p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- Core Values End -->
'@

$pattern = '(?s)<!-- Core Values Section -->.*?<!-- Core Values End -->'
$content = [regex]::Replace($content, $pattern, $newBlock.Trim())
$content | Set-Content 'about-us.html' -Encoding UTF8
Write-Host "Done"
