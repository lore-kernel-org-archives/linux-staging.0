Received: from sonic304-22.consmr.mail.ir2.yahoo.com (sonic304-22.consmr.mail.ir2.yahoo.com [77.238.179.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AF72DE6FF
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154697; cv=none; b=rbRYci70pa0331q2r7QhM10FXUU7Mj23U0kY372xkal5HKy0TzWt7kC+PS0CAgFTi6eIuj1F/DsJBwHqfUwP16HWpBLjRwwpiGWoZ+05a0Lp8i5ATVgQAc189YAO+LLwbTRPlsWFugyVxglGL92ZJ64bOIcnb9z0V6XTgvxpRUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154697; c=relaxed/simple;
	bh=tnTelSF5Hz+M77Qvixm3LsOQrdz2NZ+cUGRq9e2LkSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=PtAxGlFg/bwG8e2AAlvk4JW8lhBw+BoOdCPyJh5rP3zo7/NIeS1GksRWO9SFg+O6s29WV4a1Xu6pqmV0tZMva8zwM7Ysn6HWkhAt5YfMRqdyQ8W7JilQ1EFpTz7x+Yho1CV7H72E8aI9yYFcVWQWM0pkIAlKXm4ZE4gCPJJkl0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=jsfVMViU; arc=none smtp.client-ip=77.238.179.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="jsfVMViU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773154694; bh=uQSUY86SxNAaCKY2iibBKvrX5LTEOQHxxmOCoPsW7So=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=jsfVMViU+i10hZoSh0iOImZLqXvL/KkfLiGaPOn0Ilcw1XOPE1tZyf1RcvdYuiZwqrnkpvO8buQWxu6adAKjD5DuvlmdkwwWyx17JriVY1Mg9QCT9dnmMmWtsXCDjH4XQjpqWsOP/F78B85G/4b9a37J2FVmoMMoJcoJOx/xxCMf+H0kb70TQd+1pAzUfXcyo8kVbnOREvFGKv1m8/CX0RB4HOOwEcaAM9zXY6BCf/TZ8/rqXiqqnCNZYf7r+5HOVA3ipOKIO7RXrGBiOxfwgiRLGsuo9jhjCb3R92t2n4UCyxzpDvZxr1clXSl/CWhJKOmc+gYFiSMnibZ4z0yuPw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773154694; bh=n6/auwB686ISABDYxbTqFOTqEJWVJhm2dieb49/AmsQ=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=F3qpmQESGojLh/JT0+WYYu/Al5miHiJXDjNjZ/lSCB92ZksDZ2RxXEBZepODb77Fc5EVvLpp5BQ04Wu674Dqi6UunUndj1TKEhHfkf8Ude2bf0lkRzGyA/pvBSGFPA0FRRUfInbspCVo2hOsxOy4LeFbjDOJik18rvgCTs0jl5Vyran92sm/5oWp5+X1UIWzB5xjM9gVvucL9wo5nod75YnJDkaacHWZiWT8mE5oQakm0q95U0mTBzTg1A77MeZgkkW+LigTinz7kPc9vq+pqJg8ehYHB6sHieSOHBbGiWpnOq97/74AcPc/VI+v0Ngo6QX8NInNnL+yYfnAKIc4jQ==
X-YMail-OSG: PL7tpXMVM1kH5ei4bVKsWYPSTt_D7mdl8tYiv_HnWu4ypUpEL9Z0LMH9OW3m.MU
 W3R7pFE0WMrUomTrpqmhyt3oY5pTesOZp.gChKljuumLU5n.Vo2HyqrL8jRVzpLMRdHALIaNkXfR
 4_i1ONt.0NyZyv6x8ZJ8OJ7e83D2cvaZo5MH9SCt1Y4z90E7ikrJW5z0159bq7UYhWvDYiF_in5Y
 XR8SwHp0rvx2cPT6G51pWAcs0LSSpFD0X02yxTwMysY3.7PSTZWBtHLtOko_WXj3_NSr.UfFLLoI
 WFuKL4h3vVGj6UCXS2.1nL5qD0PxXeKjj7SSFFV.YDfAq.j_GSKbcEf1OSnatWL73h15Jdfw0mo4
 kJkr3i6AkiJ20ABD1GARIXiVPu84MnyOx7atzCcwfJGXvry.cea1t.5tIfZLLWcxBGu49DhAmLtW
 Vweb4nBAft_3ICp7YDSlKVmpPjWUjR1odw9aVrXys5BIcVh9N3qiyAKbGWDeacjZbAaNH_vnEYYa
 Ft52G3tiDE8WTHFCNF.ZZuXC.RpTdmmGKq3sZKixLGdKxzRQ9Ulep8i5gloks0nGfsctiCBVlTko
 ryrju64MiyEXAK.iGcxrmZlF6osqe0k4Z2PFCt0AjX6K0G0bh2mO8LA4X0Umgqn2cWntEDk.7vSw
 b_jOJsbjm5eY_wfINyj0pE4GWyT1s4P2pGbgmFSpy17X41ljrrzJmAQ4fQDEPFihzvJLECDBwnEL
 fuxUXzo0EO9SCZykU1fXetNDOaxRbMCA3eog.Tk.IGIjYY2OuX3j6wEDduWsSsy.gwCnV1YcEO7A
 j3S_Im.JzWN1rzbOHOUQInbSh8tjj7E0JCdEXyuq5xlrXATgyhKkJCf8TLbbPMayC2Wc_eMST_fS
 oaWGv5QIJEi..viIWvH.c7z0pMSagOj8Mgr37sWHKUJ5.zw._Ax7zsaoLnDR9tJkaGW4vnHU7e7b
 5_cFb60dHbTcVxE88hu8bwtY3N0V9tB1HYbQB4BJBGE4okCZRkmXz635mFJn_tWWlCpVypQeZX_S
 P4MZ4b6NZS_aOL5BMqYo1lW7Q3Cy.i7_XM96K9YaLoSmBqxRsPMkAnm8wFyto9_mW6UVQ5laXSHz
 tsPgIoBCQ0RCVoH7EFWJCRpNNye2RNaSYVHzTBK.iNoCIK55sB2339Z3UOI2a9_fFip6fpQdrmB4
 uR8Jy7tJsqNUT60AbCvJO6MYoCQmUYzyNWHfOJCtlQ6E1imuzTBMRWTSEEch9IKoAf1YLmYApIPA
 i4jVxz4IJClsB5ghw46K8s6GY3SavqkqrbJo8VyUtjQn8EhCzCuaK.lAKbzsUFaeEbbrX851TTIW
 xyp2gpAQKxRUnR.BQOR0aw8yKxvmGMIvvlmjtS3sak1ECnbdWOpP9stqj9Xm9k6nmTnV09959jgS
 ufdsSzuRkopZ70yAsixowNdclMQS3t6W7pQqTd8LTSwJp9QeEhrwx57HDrIN8Oz70YvGTJlMGzcR
 Se5LD35j8poJ1A3_npR3cYQuMhSvnPyoAGPN.xPoclSXyDwsNjNNRdI7r7xBAFHOdMcpNzFE.xJ_
 M7j1k1aPXX72SRwvXI8wFDOBGAoGcRZoiRQ.4TUQSvjzcujDaJVaqpZJxyblvPnFgw4gkAKXGcn5
 iQQujHyyu0XdqjcHwanIC4Z4S.KRKMxOKPQSU2wD_FP0YGnI8XHpMFJsUX9RFOdldFTlFy9zsN3D
 4f_e5gc0s92IUFkvcDeJFMLeFW5juVBhSVlJvIVE_6jhmujo4XK47DGpo3H2Wna3T6T0wLWYpZuU
 s8lzVx1ZaS0INgOb4JYLlbr6iAgWIOtGCf.E4gIpAanDOLjZSzvzemv59r4HKhW0IMXFoBMPE4Ef
 480CH3jKwdnHodB22T1sV0m0AM7u_gRDK7pJLW2aX6G8M9fCUCslBcmt9lvza.z7FaDWt8hnHats
 OZM4P6ohxV1GPIl0bXwUY2jdMb2ccUHtjDSiQ1Nr1iOf1RPiguXHKQK7KpqoKp1pF5g_ktOVTvNd
 GHE0V9G4wbgLK6GvPJauSwxw4Kct2R.g8mzQvOBh.KX.FLT7Q9XtHVcIvgUmLsYM2CwO0CPZeV9l
 EMSDlbWnKk2dTUiixHRvFkEPKHXDRdrpIOafJ3AbQbdyElVauXgGY65MUSz8T_PmOsKCOuU37J8i
 .EW623MTHDXuTCQO63CD6mKxx3zwlY7687AHjcJY_xuRXzFQY4hx1AMfDXBnytM4rXwzXt2Jqimg
 hlSH74boxUCCtyy549Wv0.Fk9HJWCrULFgqqDGgOIc3_cuc4A9ux2F2k759jNKxS9XGWNFYcoo2R
 jcxjBo4tsFA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 49c486a6-e0e2-42db-b454-cf4647239d5b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 14:58:14 +0000
Received: by hermes--production-ir2-bbcfb4457-796l5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e98ade4e868654dcf98b6069c9093805;
          Tue, 10 Mar 2026 14:27:47 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 15:27:44 +0100
Subject: [PATCH v2] media: staging: atomisp: Remove unnecessary return
 statement in void function
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7Zh2ACOuuIdhAWWUSYQhLTYSw
 t2tnMDdf3/x3gaBvXCAW7aB5yhBdEpApwzc0E5PRukTAxm6mNyU2C46SpjR86iRMar0aS9vP2G
 kDgvHlaWeyZKDJJk9P+RzBO5N4kHCon49etH+3r/V0aLFyhCXecGuK6712g6q5/kFzb7vX/eb4
 +jLAAAA
X-Change-ID: 20260305-atomisp-remove-void-return-v2b-4ce912de212c
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
References: <20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25.ref@yahoo.pl>

Remove redundant 'return;' at the end of void function
ia_css_dvs_statistics_get(). Void functions do not need an explicit
return statement at the end. No other occurrences in this file.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- Fixed subject prefix to 'media: staging: atomisp:' (reported by media CI robot)
- Rebased on media-committers/next
- Verified with checkpatch.pl --strict: 0 errors, 0 warnings
- Compiled successfully: make M=drivers/staging/media/atomisp/
- Module loaded successfully in QEMU with Linux 7.0-rc2
- Link to v1: https://lore.kernel.org/r/20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48@yahoo.pl
---
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index 9ccdb66de2df..3d2cb2d25fdb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -269,5 +269,4 @@ ia_css_dvs_statistics_get(enum dvs_statistics_type type,
 		ia_css_get_dvs2_statistics(host_stats->p_dvs2_statistics_host,
 					   isp_stats->p_dvs_statistics_isp);
 	}
-	return;
 }

---
base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
change-id: 20260305-atomisp-remove-void-return-v2b-4ce912de212c

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

