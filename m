Received: from sonic308-10.consmr.mail.ne1.yahoo.com (sonic308-10.consmr.mail.ne1.yahoo.com [66.163.187.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50858E556
	for <linux-staging@lists.linux.dev>; Fri,  3 May 2024 02:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.187.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714702358; cv=none; b=Y5qLe/wz2vHkSZ8iRMcjVKOySiLQQLz2JCW0utgmeAbmOvVB3eVTL4XBMWbsM0Q6Iu0m9nnbJoGZ79RIixXIO9zpL58dbBZLPAYpwLn7fyOIX23fAoauxDpu1leT1LD9RHxP/ysRyLTZyuwDW0SsW/Eo0HVbsDsUNZavURKhVOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714702358; c=relaxed/simple;
	bh=m6gVHnpDv94OtQb1WzCQEDhgWX+/rpjohINTSTQBcqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:References; b=QLT48q9wE+giHvagCBt0ejUkRO5Matng3yshntM7Bm5xyX8/ISX89UcKQ85rk6Xk4MrmShEFv7HN2JI/QMsH3+lQh5NT3NIeEGwsIvtbHI/ukLgcL/nP8wudRPiqEPDfuAsP8mqccMF6xJVtyHzrDHfS298GOox+EmArCtpJ1MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=eEcw46Xp; arc=none smtp.client-ip=66.163.187.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="eEcw46Xp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1714702356; bh=wZFvjf7RvGdDPgjEKbgS98RbOprhqvsUijRsQOl4YtQ=; h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To; b=eEcw46XpZM90/D8DaHHdUybjrU0aROG6i4dteHYEyYkZGaxvGwo+Jc5WZRQieNYD8/mH/qeX+9ABICgWKO1MfjeagGpnhXuKJfahHJpnOP6O8IIBnGMqtjo2/ChCsaUY0/+XpVW+OLwy/bhDZGPwhOc2kAuvJ1KIpoubFULHn/BY3odGk08rCd2zsj/xSPt7+y5biCj+kZ1CF++nQF8NpSeFiIWOoOkssE6J/1iRlsLad9KQ1/Oufx6JpDyhUullW0wSerQMaMjxcKv/3FcNVGxsg7C2WkUAcoN7os7H4j09K8qOhzhnGZCNU84wJp5S2u3EYoQ1zBQR6cGlb5pFUw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1714702356; bh=eDZ2Cnr6yUwu5gplPhhShWZjJH5ks4XIIKCnc6IyIJe=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=dKDHBezlu9EtlA4Aa6cCi4hdQrIeeReC+1gAqHy6MV6b2uuYAkfTvW/x6YEraDRpWRm7H6cfYtOpkMr6gaLjqChWfvYbK0GPipAWSvZuzwKB1YzodG40mwiQSXo9aRrWx/Oj3D51MmQd9wqg9X5hsC3XQXPtO/Myx0IhjRkAUB0pmoqVyWT3q4a5filcOf784tclap8E9URx2auNqYfbZb7zOTxwZ/JhQEHRsQUQg9+LOQG4Zh9ZaDSzkGCi8ThhKC2tAPQYXNLrRGqcS1U3V05g0LyRBkgUX++Ifq4YL3hU235uQEssSwdgFtiNkCWQZqfwzfzsbF65ZXX+3NBYrA==
X-YMail-OSG: i4heJ40VM1m_KJzltkzucO2ER1ebgjMXpP9ji3gk2lEsQW790DetMDaqeczECj_
 I50qrDUDSbbwfcGiHVEx34C3vwRb6dvvxYHWZliLmy6IUJV3echC245Vi0fJ6LrWh82bHrZupv5I
 9ygoSZjkx6jZFhPcZT1HcN9fKHIRgl8frlxqmsfyDpSw3DozAYzio_qxHaC_jnA5NFoj4n0GQO_8
 YSOnOwA_4vgcJZLg5KihVV0q9oCNNbI3BETspiD3fWd7OU5aWjYIxKYh19_cpPaP6BZ3kkZ_Afs9
 sd2joKEzpKtnv.9YYpdvXNZZ33LfZL9yc.6w4g2cDjNo0dgVB5cUwizCRKohLTzUXmbqBHO_BryU
 NTCCvIovFBCfELKARoxEk.ZGPPa5VBse7cP4cKcHwy0j05f1QdqYQUkxH7Lbv6meWKTvbawtmgvv
 fnluzb4fqrWlsAP3e0h0kmP4WjVsTrGtt3990wk0as2NbBCbRoSB5T86sScUpS8cShWmz1.PKROF
 FQzgQl6nTSTbHatrORrI2Hiuc_8MPfXUoHEvDmtn5Ylgcokz_GNU2mEu9O3FRJbsUsnriZgrGLp.
 aMxVW_vfV_XIgHxo3LmkWNEzD3MrSXqr42z_wybmrwVjpsGiZvvnnVfcRh6ztEyzNQlLh1ADhuVw
 RReGbR6pBZUPIz8AIiECLH3rdjCDtNpA1uwGsiiLPsTEoRgGAyasxGfJsNdn_I4xKr2dWUdug58E
 VhobfxYTZ36aNbvCdE1lIHt0z5EuPzTWw_oif9TWSCu9c0slfJAgf4QGqC5uTXnfmoT11XrIhio.
 2I6OhHGYmFoiAHJsiLPgTYbV60Mp0vlMhiaK_veAEuSpi4QSOw669UPSQQ97c8JLLgPxJsl9irjY
 39poMhvQQNlax2M0JwxEx3L_E9FAfvPv9uGc9FlLjTaIJq8L_o365u0uhvQm5TJbbVBuIt_FEsSL
 xcu1KFha4jGyGwmY1Cp7YxgDprax6lYkiCl5K_vJ._qLTqzTarXF1QpsY3.QnfT0nGT7OtzfZkYr
 gydSGtk1SxICOP7PWuP6xwjKesTd4HBw0coXbGoNEuM8UV7gW5.C3m74Sm.hpt2eF40f0XkhyEAS
 U0H5YupQTeGjJuCYASEJdlmoPYbSz3IpL1DjeVNSwcZI6oWUiJgjkHtRSMiSQfEjYrAX7jBWOR73
 dlgMafL6_5hTITA0GvO8l.y0_yeiKSGHBtFt00e.WMmdycMuYDz9bwLxXf8bgldgQg3Yjddcgq_E
 Roknb9X0xZ1E2RmTtWfaDDUF7QU128wfZPowThgfXGHKiYlEDIlqyEuY9bWAyMzO.zKEINJNEozr
 TCHJB.nPCBmuBr2YT36Qza2T3WfB7Fs1VNjkp7FXEB_WjjUFBHHfHHTGHazN0GsGXr.V3sCwSClL
 pzvV8jP1TnDzUp4kOvJZirGKD_9GmYcRDkbQ4_VN4dQjnqDdsuxIkq_10DXFzN2x_OHNaJqNdp49
 gFgd_xOOQnbssGzudO84cizrCN2voih47nVycusDFw7mlO8bTV8RWA5E7wNgWtWA5h4ZwS.HkTWL
 veM9Xw8L0asLPfs6Nf4URGvuaRQk10FkwBcHJMWtl9v8HK33Yk5FRCdrmyCTsUECLfgV34aVF.t.
 .bxa7ZyvatYhvFvRQpf09cGzscegTzWcip.V6I5NcbdPhsde0Vg2kE5coV.l7dX5aoMkSPQ4eLLT
 REkNM2cOzQ5grXmRZPzAJHzWBoI273P6hgrQsubgoID33969IG0cfUd8OwyloOJ4ohB4KwO0Db_Y
 hlGjY9gydLZajXgNndM5roe6uSDtRTn3kWfQTDc4sPvDM64LLH35SzwqDYCht.JM0gJ1w8wTPDGA
 7Ym2_xQGrlfs1LCYTDiYsfJUQD27dhrI6xUf9mdTGYeMfTAq8wrCQ_houkmM0ObTCCpfzLAHuyqt
 5HHcLTmpJMZbzcbKBe_IS19GeNdXgbwCOHEuui9_TWcE5osO8EVqXWi9OyxRL6RJJPK0s6AmdU5p
 FfE6Rfo.fOB.PFX6kgdLq3MJ524jddI468avFD6eH6l5fLVqZKCwEU6S554TfpUSsYlSfqtd_ygE
 vgVHq8GeWtg3v.w.XN6tz8ISKQOEvoX2Rhf6lXgJgW6a5nBFMRCYQDzHFw6Qh5MG5B_VE8ApcNnl
 i9Tm_puz_js41P.lB2Xw_QsLTYgdgCSN.7_5utEy6m_gEqwf3Hxdph3rgVjkIehi2HnQr7lrNIy4
 Oi7pkuF_rVp_agcOlky5amx_IGQPgWFvT4Fy60d3yhD3HHLOA6l.C19BeyxEuWtHd2PmhfK4x.Uj
 jtZ655w--
X-Sonic-MF: <ashokemailat@yahoo.com>
X-Sonic-ID: 31c30ff9-4da8-4db6-9f97-f559213ed16e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Fri, 3 May 2024 02:12:36 +0000
Received: by hermes--production-bf1-5cc9fc94c8-df4vd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID ab2e3e683b80a82edced05c4a0938865;
          Fri, 03 May 2024 01:52:19 +0000 (UTC)
Date: Thu, 2 May 2024 18:52:16 -0700
From: Ashok Kumar <ashokemailat@yahoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: ashokemailat@yahoo.com
Subject: [PATCH] staging: fb_tinylcd Alignment to open parenthesis
Message-ID: <ZjRDUO6/M+RDCcQJ@c>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
References: <ZjRDUO6/M+RDCcQJ.ref@c>
X-Mailer: WebService/1.1.22256 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Corrected coding style CHECK: Alignment should match open parenthesis

Signed-off-by: Ashok Kumar <ashokemailat@yahoo.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..60cda57bcb33 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	udelay(250);
-- 
2.34.1

