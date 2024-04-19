Received: from sonic312-24.consmr.mail.ne1.yahoo.com (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6113BAFC
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 18:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713551087; cv=none; b=qTZtjXJyaP3hbQ2+3jQ8i2U/BgyhjoyG32XWogWAYP8Ji5Z/3Nhq8OSXYaJ8rLJ9HiTabwXvlCbtXHbXjFnrHFKW1ZxwTVnOXx94VWxhIfxop2ZHBii5eIw/M5Pnkei06/95R24ve2qdx43SCbRZfzJLmYHkCDq8qD56iL1w3oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713551087; c=relaxed/simple;
	bh=blljeHd9x0gxpn93U2C8DaW0yA8kvS6g/Q5C5nSZpfE=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version:
	 References; b=ZcYL1WLEN6P4TbVcllgl2vaGsVEWP1EEriLX9UFnTtG5FREtmUhlQBF74i6CDerW75ptXTsi/1zVGubJ+MyZw0TgkCy4csfvyiOz1D90cS/O/ShN17RA+5EQjyd9fbbKwNU5Rk0cFKS/St6BtcepHLab+ScFNYOkaMO9nOAzed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=pIuMwthc; arc=none smtp.client-ip=66.163.191.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="pIuMwthc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713551079; bh=RG/96UbEdQ52BT0k7TkxJ3eNd7aF8qeJn1MJEz+axZc=; h=Subject:From:To:Cc:Date:References:From:Subject:Reply-To; b=pIuMwthcDDLpD8lMr8l2fikKv4TwSOKdEmcQL/zy6ppH6lXnVl1uV94slFN9AsFWlzRH8AN+d9wU3sEztRboYVKX9ucSuD+lOw2N6pcgIOTix0o9rJU7T9EZRbTDVP6Si3kjXcgmMimJybAFyvRFHal6M2gGrI1p1l64FtdHqQPCVjUN1EExcj3oA7uY6A5dL2DUACQVEC0wo7kRqhcDdfHFgs50ZPa2jbCN3mfcYe2fVEPLRw6k7kjsSDmMaIPXMDvqef/CeTzaMARrEVpW2vOEcBt82P2X+PysLxB27o2Rzx1+XWEm/4zLMn6MuyEEJeGvLqjTVF8gaF5zLFPUWQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713551079; bh=tIixrHwTc71IQpC7vSj3s4soIiN66nail3BVR6X3WiX=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=FWpoSa5/CZvExkpxqZJxjWBozRkxeM8aXLpzC1px3WCtW8QkrUdk6MyRkWNoDJnwoVREJVHEB8VYD0OD08gbihq8Iut+DATHobnagoq8Ek2v/J4Z6AG7iVKgErfUUJK58YNn3ue9phYEr86IJqJSXqJlkN3h+cjoi7jcjgIjIujZ2rvdI2gQtPegEZRq+hKjO2f+5Ut4KFviFOLAjV0B/Zvqn75MYXclAs4CExh3HIkdSdYHjoNSSIf2Csej2FQGuVcZ/0Fg2Wv86dOoH1KUr0uGcqCR/j4Vd179W0IDYGgz+iiLH4JdN2nSfN2CjOCdxHk2K5YVZW/HKJgBzC4jaQ==
X-YMail-OSG: e3gt4eoVM1nSYo.FK8LfKpIhGX4b9fecFRCvCnUBSr0WQrciss7EyRTloalubBa
 evlFHT1GrinFRAOhXeHK6yXFR.q8TqByobyZ11NzOg6wwQ0FsTelCw6FtrXZKHuOh09v7T65XcXG
 c93m_oaHdaJOPm89vxLvFrAIMsYH5CbxvKnDvU44_Jl_j_jxQvnh7m37Z_fTR6m54PEkclTr9B9l
 Tw8Q48bda4f4QPNuwjgIyuAQkBd61EEx2qqjEuvCyfHLprAnbdq4KWJrkX09d1xBK1PBcNCLmVDd
 AzCxEwBSoi6y59gfRxqNcjow7Q4g9_.o1Sff4TuTE6nlmRew_kKTsAWsFqgavvtFysIF2gFzNzTC
 XLFfU0JPEw_sG0nYSTRQEv0wDbYayEiKJNnoC.Ms9DcyK5R_jqMYFYA4rHbw2OopW.1M_6JHaUrF
 U5SMAz4oRHdpWvFqdzp7I1A65IQjFOL1QeF2FQO3QeUDvy9nUfQuLFq88RCz4iJIsLl8mtIl9buT
 cE.2BAwy4V7XA1i4jcBmIUMB92KItRoTaR37dmPXoIlWStIG.EOypwwj1eYOYSZNcGBVchYUkMUe
 kDXD2tMq0c_Ho6a82R2Hor8u_CBAkwpVXUY0uVcXEcEN2ej1PGE6BN3DYh97If3nxlqzf8b4sHLc
 aRVacWi9wq7iDDiqURn5l1jcX7wXLzD3hoU5MXntdqZtk.yelaxVh5S6sEpEQdoMdiqLckqANI.f
 YAhcSoK2RMkFIrB69QYqwIdr7k9cl2wvdsznB3SiyZ1T2FVpkg6YdGVNYCjDespEdHvVe10ijW_6
 mRfuSt_IKyawsHyb5xGsOh3x7pLxmZL6iecezqknA9XMyjJzHsdZk7Ra5KcawBnSqLnXZzYpROH4
 3h_Pzq8TK8S4i.qREWgedGl6l.LYZ2Lha_yLgXSWZnLTqp1tALivXx5nxLedBIxXhhFst4cnjSdA
 Wx6YQQt6JZTBA9QtCZtRE02WJdzw8J.5TMQOpI1DT5f847IO9GDw682jYZVs.2VasAp7E54O8In4
 PObCWFYlKVYxLgOmZ0I3rkWwtJmfsPbwsPUHeCajcl5EsU5i._nQKSbKhnDNhH2PInAAVVoo_hvg
 hgloVBRhKwHPi8uoXGWYSfqiXTHFohfNdfYYmkTf5tJOPU5d0D_FyA3W922IwfQBm3T_hBJJ4sew
 qhHbOAwRQ6T58c9lw5o3X7TxxMUJbBcdYHUMvpl1m2G_Xczg5BNyxu8oZAvudKoo7kCBFuGcETCw
 PPttj7ZQmBSLQSAhGho5BWIhKzSLGuXEU7lXp7A74.k99PG0NpKrWbzLVZPffeOtSGzSgLS51dex
 rWderropquae7ISoo51qrxjTTyolWecnHUWPhnP6_tKus_jWP5UXYvqpV2VyRSSkZ9E5eSDHhVAS
 gGFOhPFC.mCGdK671VM0S_riM3ZNY3UbgY.R2GfEx1LqAB2M.bwn068M.6ABKCXkqXQQq2c8rAYX
 GxXaiTUjvV3i_b9W.s_qE._Lh3NAKzCaSJQ.mE8oRcBHjfebbbHbE9clOXHA1QIhYUSPDMVoijyL
 llzYG8.MQv2zbJLOwRceXXJwH5flSChhkpcbKZ_yIwYf6.hQG.YJSdjSJP6EEHdu_6AOhdsiBGUG
 m63ulRslibRTGsZV3wpf.gjA_rWOfhD.nS4S5tG5pv2OAZcccg9brpbgeSI2Idy4T5Z1ufiptbv7
 94.CjaaV7EIxzEGNedmQOn_eaHHSVu8HHNZpusGmWMRDbYSd1QK.UzZd6CFdCzorg.boPTh1bAN_
 8nQqhyUb.MnSQ1xro31c2N2AoM_uNN3DmDEdxuQN3.Fz0fLdKRHCq78yxYI75IbXjbO8JDs1eM_G
 yvCztbZiXrCFzVRtFbZV_7DSR.Y5VN8_hSJBM4ddhFOdnEjhmSlAk_2XANNsBh.AUgmr4dPEemZW
 aK_lCKLjbIqETWwvN8QheQM2c.emmT6bBtXbY7Q4k0ZEcmQ4Vlz7g2qvEPdqS7LaU2dVo4V7O_N.
 HiCv5vUO5a0arvHwIHKlfRaLbizTTfNgx4AWFTcNcNSpZ3nyjgxBC7GdLKO0Uz930ZefL0OONtHj
 zK8Ee9qDnmseHDnodSr9i5NJpSwLUU5tpZzDnn0Yfi8BGNaFaCMD.5HNoR8tt05KuY4gXix2eS1y
 Wt.vx0U696NEOp6FCH1VTVMoGYx3HEKjayiof6oN76uWrGLGPyFNvtAGSY9M3KTz405aOstV_t5Q
 SqM9QJ_7zgjlFnON_5wka2ih2VZS7mMXe4oT4QDlPfGB01oaR9_mjS5JkhfGXEFhWfePTWuVS6MC
 _SnW3Opp0fjXXNM_iRGoMF.5LGjluVfQydZFxg99f
X-Sonic-MF: <ashokemailat@yahoo.com>
X-Sonic-ID: 78246457-ecc3-42ca-977f-d023cbde13c7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Fri, 19 Apr 2024 18:24:39 +0000
Received: by hermes--production-bf1-5cc9fc94c8-2vdn9 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID ee5c49b4a47ca886366b559aa52960a3;
          Fri, 19 Apr 2024 18:04:23 +0000 (UTC)
Message-ID: <452e4a2dcdc7020f75b84d787297a1d17a21ca81.camel@yahoo.com>
Subject: [PATCH] staging:fbtft:fb_ili9320 Removed redundant Parentheses
From: A <ashokemailat@yahoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Cc: ashokemailat@yahoo.com
Date: Fri, 19 Apr 2024 11:04:21 -0700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <452e4a2dcdc7020f75b84d787297a1d17a21ca81.camel.ref@yahoo.com>
X-Mailer: WebService/1.1.22256 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

From 51e98164e314a2d1d834d2a9baea21a9823650bb Mon Sep 17 00:00:00 2001
From: Ashok Kumar <ashokemailat@yahoo.com>
Date: Fri, 19 Apr 2024 10:32:48 -0700
Subject: [PATCH] staging:fbtft:fb_ili9320 Removed redundant
 Parentheses

Adhere to Linux kernel coding style.
Reported by checkpatch

CHECK: Unnecessary parentheses around 'devcode !=3D 0x0000'
+       if ((devcode !=3D 0x0000) && (devcode !=3D 0x9320))

Signed-off-by: Ashok Kumar <ashokemailat@yahoo.com>
---
 drivers/staging/fbtft/fb_ili9320.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9320.c
b/drivers/staging/fbtft/fb_ili9320.c
index 0be7c2d51548..409b54cc562e 100644
--- a/drivers/staging/fbtft/fb_ili9320.c
+++ b/drivers/staging/fbtft/fb_ili9320.c
@@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
 	devcode =3D read_devicecode(par);
 	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code:
0x%04X\n",
 		      devcode);
-	if ((devcode !=3D 0x0000) && (devcode !=3D 0x9320))
+	if (devcode !=3D 0x0000 && devcode !=3D 0x9320)
 		dev_warn(par->info->device,
 			 "Unrecognized Device code: 0x%04X (expected
0x9320)\n",
 			devcode);
--=20
2.34.1


