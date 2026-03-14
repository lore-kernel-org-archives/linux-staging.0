Received: from sonic311-30.consmr.mail.ir2.yahoo.com (sonic311-30.consmr.mail.ir2.yahoo.com [77.238.176.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06A92BE026
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773479515; cv=none; b=GWSFT75WaMcvtK/ga9k0o6EOsRcDnfWsdZ/4p5ByQ4DBacT58nfBsJeuRu9UPBdnIGabi8pQxX0b+lWXBa2sYDAZiuzwRoAKTuJTJFUoCRWU0BUhm6zcYsLxhnTz9Rfnsf35fSFNz/prUn74Dsf1uQkpNs5UNAOK63lb8Pk+fQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773479515; c=relaxed/simple;
	bh=VLpwPR9Uz0GxbRenryV0mbl23p65HLojHNRONBdpNCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=q6fByciYjMwtV4SrCieQurPYctuVmcAtzByNLHURGSs1EipHiV0fHp+KIiehBSsiLSG77kECqS7ItTiab51pcsjNHotptVOeQxf4LPe0WrvVoZtI2v4Te+doXGkMnluDN6BwElzQuKh4T76e2BS1AeNmuSE3VMoumjO6OcNlFgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=pXP6KyPk; arc=none smtp.client-ip=77.238.176.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="pXP6KyPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773479505; bh=Iw4SGlajyTi7BKmPwOVQF8JV8NithyHFZbbJbbutwtw=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=pXP6KyPk1BrITUksSHsFRN7aErAmtL2D+yI0PZ7LFXaf9OJJSRzF7JDScWUc4WjGzbx55xvAuknP0VieRo0kF4uFLd1ulwHL0bQ9yJgSLa4Dj2CL7BNsaGVxw2x2ez2GuP5FtdKzXnJkA03c8Z1w4/hdoR2a6hyoJoCxm90oDzMYOE8sT5p+SrXTJaLggHY4HdUjPhsARo/WCJRmkim6vKjRl1MJPq9hEkO5FiWm7Tk4Ut7ou2c8h9e1D9xHMRo9vd8+jHUz3NTdNLLM7IwRDTfcT67/MccCnk9hHL8efi59ubCKqke2PxCFUZp0TRFNVDwmS2rZtjr2lMGiOgvSmw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773479505; bh=CwJc1U7HvqKQ/Fz9IZYVR3RZ03woYnqldILduFoc3SR=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=U3QJGtkMGWgDYGWAvHi6THfYyjgGqgJGKJ6yq8HFvQMFxQqhecWB8QIbfar/5CGdjXa2l/PkPFjLQdOGB4wOgf8/gcoJvyj18uAmo+TuY/6PD2wGtbt8/duOWUGI/c8vScGaS0tgrBP3uRKD/m26ljBAiCQKHqw+0oWZCc9ZjIYH/g8DL7paKVnchjYF5fgGycSlF7pi2N2BbWClDjr67MoQvzLMW5SntyMiL6Q6m/bLlbiQVy8MRREQD795L38qLK3L1QvOmiupRO0l4E4HkADR0JlhZ/cS9W1fCQeNG7a0+7wU0A+IEVmg0ZtD9011cfS+096sCaDojysRFQXKGg==
X-YMail-OSG: WRBX77IVM1mNHalYpVnmeRVbiaYTIyB3ARdnGiQmXNVeGXs5WyNZj.TXvFt2rYB
 eV1hJq4FcSPpL5mklrpnyre_QaEylHOSyOss.P1qvypNpfGJIHy9mEwTazQ0unDwVscJZiFA4BAc
 hgc.q4wxzD0KzZRUJTobv0kNSnQnloXXy1iRW6NOo7FAAeFQjWraYriUqFgTIkI7xD8dhPCq99rb
 NnWV6yOdDS4SSGKFwHiAnVAFWODlArRTH.dnFe0aR5woQ_riqjPO9yBVqEwvYguvt0JxU.3_0hND
 XP_tT5dK6BuC6jB47D1cpgr2u9lm.ovi9UOSYtP9w0LvGXlNyHuRxFnMlagKKzhC2Cv01Dejx8Ik
 t1Rg3oq7Z1u97kJJCPWigPiqDT9.71AOXKbmxcKUyqTHmeF0musynftT3pG1yg0ZCSTuyj1hrB6U
 UVDlEWE7K5yFQVbXp4kwdkImHQ1CXuydKKVo_BYhrOMVKLAWJiCfX19qXEKHFEK7dnXzxv63n1js
 8mDQNArOgaIKII_ZGp6SioaoEX6g3e2LHdM61P6qsfHgz3gbTPur6DL9jIWazj7vAfmmIFZukayu
 EYgI68tAZuM3XuN290eEVuXW2BVbFZi1urF3d7CuXnw8G9pVRoe8pucI49QHHr79Nnb_EJqQvD5a
 kqVa8SqX4TSr6ex7OO07lf7RSW13iGC0MvUM6QRNk2H14VDfL..aGnjzuSZ1mcfbFMoRqzo6sxAK
 Sg4b88Lyr0IUGVF5L75aUa6Ako3mK.pPukCLJ8cqSLbt4Sx_JH2AuPFq1mPCt9K.sR4E.EpZGsNH
 4fUtD.ECKE_IDDnICyFk.k.gC343SLg91AtBJYYxD_2wTf1SpF6cbkEpEBOQ69BU6nNStSApfvlX
 TPuyt2PXnpxo_Kk3.S_2tk9xGXpr.oXbai9ELtA.lxg0qaWyezwtpsaMnet1O8N2cxidfBYrGoPE
 TKH2ra.uqPpYapvFkHfnXLTOuFtX9VVrBCjZMu9vBUE9YVNFAgpUwijkYZj2mxjaVX2r5lkPyHZT
 qToExyPO5fPJkjQ6lQp5wqUHLABGA7rYsF9sL.AqpsB1K14dRszmxSwV7G.skmO_MTC0F2AaTF4b
 T4P3kzwNwx4wi9N3wiurovlBeVZEs3qsbhiiPgEabArjbk7QWjRN8AZCCvi2VD20HRtP4IWdBSSB
 NshiV0DshaKZSJYgzd66FOwMffEMf7Z9SR_Lc3uc_efEP9RsmdBYhn.dMm1KWa0HSiHTaxYEuwgG
 1G6u6A5U65lB8j1vqV7J5Ur4OM9LxydK0D9EKvWAgkwA6M64dGUUjO0WZYGbo91bBjuMyXtsgobQ
 9DzBbBZgSjrFAJiwk84UvpzJ_jltwTJVRbdrd.PcQ1uaPNVHMSXgzlrfFdyru0t61q0Xf4Eck87b
 vszgM6fecmVBhHnIp.IhB5AuPn7807HmhUUnySdozJ634YIx7GHs7ENJOnlBacaBdk8ZWrk_Qyss
 EJXtoUlwHKzYD9ut5A9TCgqs7CEOVogcUeXojAp__zS5hNhCb30jnCVnJFE4WVx_c9MNEvim2EO.
 n0PPe5wt45d1X9wlDdUlYToxPcWy6aVkOi59Dma3ALtrH.8oseIAr.tTyFgoiGzLQAMwFOCeYEAC
 UCWP1dYARulUDHGnwHzDnlakp0_3Zv09_EdDEeMf89Tn6yAFI7Y_QCnWyMAgjP1Fxoz68aT3az6x
 HEijbl.p_K1jPJxajos0HvfZ0QSVYRKPlMTZT4Ivn81aPKo4LzKvRzKjhWB3FZqSqpNCG8UWiTms
 mlvMd0UDwnSETp.0MEM7_KnkFojdjPfcqGWb5YhOc2U8kIXNAD2CaPgvuajDD6RqHV28N0xPJN2z
 zRuxoRX9vJq8e9mypqz1l5uSfKMxjfzsh2xdZFWfUl6zYuzQPIHRa6Z2C6EIPs88xFo0vHxJ3jmT
 NbI1EicdJGSTdeEA9YzHQcSV6Uv9ZPqff6AnHZ150nvx9RxVXM83YqMK1LiC7hlWcIDXt2QnIizd
 EiSsyIO9ZWWwSGHehdu53X1_hmbEzz8yS_2AnSZk8uwbU60bi09weHx8SFVn4yYQqA3Z4qhB1onG
 z9uQmkYIkkaPgNHyajqt7KfvAxviW6a8bSN1lp10rtzQ49tryuHpfG.8TQLVjcochKjHuZub2pnQ
 QGZHlQ5OddU7t1zBxoydci6fU0LrL58ck17C3hCbnQ7zCrvyY03G0a7bnEALU5z6YDIP1RVkAb76
 GpDIL4swFiwMEYItY9JtsTNhJ7LlK9AmYkvs7DXtVOEY4zSF.KX7_kSxp2V0N2fWC.Afa1bGXksA
 qQz1wU8_xi1WarkTol1TszWuM
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 9e73b421-33c4-42c6-a187-0e5f9480be5f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ir2.yahoo.com with HTTP; Sat, 14 Mar 2026 09:11:45 +0000
Received: by hermes--production-ir2-bbcfb4457-64r94 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4094d5b3fc1b777ee99450a526ab8a59;
          Sat, 14 Mar 2026 09:11:42 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 14 Mar 2026 10:11:39 +0100
Subject: [PATCH] staging: rtl8723bs: replace kmalloc + memcpy with kmemdup
 in ioctl_cfg80211.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-rtl8723bs-kmemdup-v1-1-8280a436f20c@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MT3aKSHAtzI+OkYt3s3NTclNICXUvTlLSkZEOL1FQzMyWgvoKi1LT
 MCrCZ0bG1tQCOOlVwYwAAAA==
X-Change-ID: 20260314-rtl8723bs-kmemdup-95dfbc18ee66
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773479501; l=1441;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=VLpwPR9Uz0GxbRenryV0mbl23p65HLojHNRONBdpNCE=;
 b=laiWu2J626oA3vUmabF4DXmxFvkMhh4W14ib8Kfg0+eBJfwPfpvyjdgI7wbp0R0IxXMAT3h28
 s6zOG3jc8vUAP90BlDVeyX/iY+898sUJm9+BeWG3Y5ao1+95KqQVpnC
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260314-rtl8723bs-kmemdup-v1-1-8280a436f20c.ref@yahoo.pl>

Replace kmalloc() followed by memcpy() with kmemdup() which combines
both operations into a single call, making the code cleaner and more
readable. The zeroing done by kzalloc() is unnecessary here as the
entire buffer is immediately overwritten by memcpy().

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no errors or warnings.
Compiled the rtl8723bs module successfully.
Tested by loading the module in a QEMU environment - module loads
successfully with no errors.
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22bf3..2125606f7775 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1430,14 +1430,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = kzalloc(ielen, GFP_KERNEL);
+	buf = kmemdup(pie, ielen, GFP_KERNEL);
 	if (!buf) {
 		ret =  -ENOMEM;
 		goto exit;
 	}
 
-	memcpy(buf, pie, ielen);
-
 	if (ielen < RSN_HEADER_LEN) {
 		ret  = -1;
 		goto exit;

---
base-commit: 2f10e53847d208e97f23ceef3678ce8c88d2ae0e
change-id: 20260314-rtl8723bs-kmemdup-95dfbc18ee66

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

