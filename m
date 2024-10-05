Received: from sonic301-32.consmr.mail.ne1.yahoo.com (sonic301-32.consmr.mail.ne1.yahoo.com [66.163.184.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571F13632B
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 23:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728171236; cv=none; b=oS9S9AV5tuIgkBML+QNmEDjC74no5nJbvdkWzEwbWySWfSH9urZOfCwODKAS1+fU/Gl6dbLOM0oSG6EIRr+hGf8BKUo6gDAv1AfqsTvJOU8DCmYBMvnEP+sDcz1bHvhEEFzQpmykP82qnV9wKnb52/o/T/3qN4UidGQZ70lCRH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728171236; c=relaxed/simple;
	bh=rxXfbKI7HoINSjSilLtDhxejelzqF7f27FgnqP3pBrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=O/X+Afn3IZVKu/p+qqEpSYE4StZ6lZZo8uy0zbgJdTe2HS5nB5UM1Tp432cQ4eqy4qrSolrFtLy/7x0jHfGLL9l3R8ZzDvNm2r4SFS50WIjMXqDqgCc8LwheeAKJGDvYOC7P2NBAxCFDqEbR/05DK3I4nS0g1NRBuaWXl+zv3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=JtnMB8SW; arc=none smtp.client-ip=66.163.184.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="JtnMB8SW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1728171224; bh=vrsfrCvcKH+p/51CHNmSW7xCpNWQiJZgi2pSEYUyvbM=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=JtnMB8SW0Ya6kiIPGk75SePv1YKmwAC11G1IqYhwpmeVStYep0T2KSdSQ9jOzcvZCZU57Obla1iC4xR4KMiElMDqCOJnzxV0NUTbCwkHWxbO4KLVSO0X9wUeTlF5aSE4DCBxgrdx67QtOBlH6t4Q3Ckvkmc2vWqcToe5b1tP9ov3P35o+s+P0mQAS0vUWisat5C7Fjnqt9yy3/gUjoDC6JIdak3wi5AgBj4mahPGVVMcW75zhnRCbYfEDDZA5vu4ggsr4FUjpBGo2rgD9EPc82t3caQIMRtR1cfnGmYhlGG5+rYLAnVzWUIvfIu1ZNdKKGUqQ4H/SSGRfRfUZOZgnw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1728171224; bh=1t4CC9BSuJS5rqDeeUC2foVviN3psrKSQTqy7GMohZ8=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=S4RUBAJ7CXxLWojR4FjVhRtzSOQ2zLWEk+inRBboxH7q0HiPp9lKjNc2HfnuyFVCNPoObOLRryTHtoWSEFNpw8aq1rsPmxAVKesJGPD6jkk7vUSgj/L5CdewV5PvRkCFCIi5JbqH8FN+C8LmcZZI5bdHr2r9cn2a5ykcvM6Io/sz8QPAdooC4vvTH7sfl2cIUuRgDA091XfBb2UP0n0W8Iv9+7N2udPxRhjRyRSXmJ9u7eTdBC0x8PmVbjQDRLykovXfakDyCpy7E5uD35lfwRq07s0lZ+ULKvX9c64iK9js6GVcpLF50ROiqcCPAKNju2Jxfp0jLLgf0Uj4vw4IMw==
X-YMail-OSG: k6eW5YEVM1l9LV6ZKbLkRJQP6NjJmxnR2go1cXUcWjBGkM59KsRGE3ZVLFuvCt5
 fdOqL9X8cZma3Yy6xVnJ25NV7UVNpyJxmHHoOcAGkkFWJGUKW130I5OU19WzwcCw5BTEEkRCksma
 hlP.HJGIQIkJmtGZeMy98ELYY2px66P_w.6SJLtw_x0uLo2DylBxSBhREqAQ.EfHKcYlFtuvvOOP
 UpAd45doS2F0X3JHeTbQ1Qqy.D5kDLf8mHs3Ue7dt5Vu82zphS.I4W8i8FzfrZgVHDaLAdq4ccmd
 Owfws0DYSXgTainyZJQQ88KeoZ_eqr7y8WCv5rreDB8L6..JaGeQWsf8PNxm_vJbvOMmso9XjTBj
 2m3xBufEeM6cojLRinnMIOGp241NJQXb6OL2ygom4hIHdTlpPab8WL0Vnd9reaYdpCElRD.2cF0r
 LW.gQfCQysq8u59WdAqhTmL5YQuvxuLxCZao10UfleYBWj7miUF8QGl0zkpTgjGSfXWkcbH4eYuN
 afvwFP2ogUyKZJcevYeKmT_AI4c1Tn3kjlbHMvMEb4vAhGKERMknsyCxtICfAxUYBi.5QkxPg5fr
 707AL3Js01I7pjwHJMlSnpg0CwZL9gDgdzccxB2Xz_jpU.rvfPD0gizVPtd3G.KAz8QNWXwm7nOf
 1yEGICHbxP8taPzNTm.YzeVWSOjc5nBck3k2Q6Pzp_dmX9DpHlmykDJ_YpzP5jkuLR5R_UvJ9d85
 oApoEtxkA0Ar9OYvuRSJOHxN46Sbtx.5C7es52mTI98iHu.fajpAiwR5G_AqvcTayOIKrZjlMVzl
 1SptenBoDD1spKVDCziky6CX9TRL1wfQLaX_i36oJPnciKhLKu1uLAQ8z2ObQgC1SmD1cjGRLDuG
 26zLY5NOe5JGGOfU8jtK8nTivGDcEliCMkPSZ1Gbh1SWx6JXllsot.qZ4zIN_.HEvB2s.tTNPmRj
 wipYiYPjVZbZ8Byu3sG_8gskOkg2RFheza5Cu0eujplnBgWx8ZpaCW959vNfwHHvf_qxN1qw2Aw5
 Yj0XgFmG7uc2Pwt8RONU_4g0pB.xMD9PjgIfeAU_434J2He59jFjjMtTDfMmpK.Zq.zvpRRyCqmX
 788l4OWi49ULrZc84oPo0yHuPmdFkcUG54Jv1UJ05J3YDSCzu.YtgAuXXkJ55ArJaLLr5L0Mc4c2
 Hd3oB5.O5wQZ5Nz13cQyuTgpFw1mh7cP_QW3hq_P0mm_D6zp9B4Fe2ZV6KGO2ZTtpBF7ck01MbTq
 IP.77eSm5qDBpCLy4n57kft8.cEnjllnee8vLei2E9OO.RRfpEYnVcm2ILKMzc9WNeP2d0XMXSPg
 2NclGkMDtiE7DDKhzf0LlErygIJzpAMSBpblWY11E05hKSKYmVSk.aK8KQ96mUBCzsaa.6ZXcYgb
 PV03iBToxNRVYMCsac79EWzjIfWsf4FiLHEv6Gew_dlX0SJzetR0sRUP2NH2I6u2X9USubjg3b37
 KGkQ4uU6etRj5OZw8DgGT4COLNvZD0mev46WiZKa7a.BKyBmqUKMzY_h4OJUF5lgar39JZepX2XY
 Opo4kQTu2speKLLOTynrggh703p.0_gPBAcomVnjtfcrEirfdcMHsfF19lAfFdQYc4IGuUGUGuJ6
 jtNJuQ7KEkBVV9yfpmzeBb93U1QA0UN5748Gt2FCy1BzsPkAvM9WMm1gGCG30K49mYqT5GAkdFGN
 PS.bMBipbwVoZk1GULXQIFGCdIxouk5sNM0CUjhPWEw3XtzMSmCM13dBOyfPqeV_fcEaWKQ6zUri
 07XsUvDyROMK4xVu1CVmrhlkrXXEVmK8lsPKRabTkgQOBkFKw.SWFDyfpGo39.qpddGbS6kZTij_
 IdtQldcpWxvlu3mYVrenIyhhU07SE9gMKJhSmbcT.HxHDmtw2MLoDFGKyavyWQktJj2xt5cX9ekN
 vLYy4C8rHjxHh_NOlXpLzeLT46WRgHBXD7ZvuOWtDNbsc5s_n21eTgC6g7UbwOds1I76gaYm31Ly
 0a0nWbgExBH9G4bP0j3vpP9lD5rSmUuZQ22aZuvF98Z3VkX7G4HfF1sUR7XuuqPINfxen4ItFG_e
 yKOuW_x83qs_7glJVhiI1UpZag7noPDqYS4MweB894KK8oUz6YfsjHS89m345d87gZBHYDVZkzTN
 30JN9Oy5mjgFWQY9ACv7YCW_5oxOCZRMzrNN1HOhZXTsxQDVjNzuKYBae.4YOM84l8CtpfAbGjwU
 dGsJD7izlWPPevAknHGHXiwyF0j9uYZXh3EcWawz8cnU4ezJlIet4vtdH6enzN7oplIaA6Bwxi5G
 50hI8CroTJA--
X-Sonic-MF: <sakunix@yahoo.com>
X-Sonic-ID: 390e9c94-e0a3-4211-b0d0-52cabdeadbda
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Sat, 5 Oct 2024 23:33:44 +0000
Received: by hermes--production-gq1-5d95dc458-vkwd9 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7bccbf4be68b8222fa6e05b9bd2afffb;
          Sat, 05 Oct 2024 23:33:38 +0000 (UTC)
From: Manuel Quintero F <sakunix@yahoo.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Manuel Quintero F <sakunix@yahoo.com>
Subject: [PATCH] staging: rtl8723bs: core: rtw_cmd: Missing a blank line after declarations
Date: Sat,  5 Oct 2024 16:33:08 -0700
Message-ID: <20241005233308.4520-1-sakunix@yahoo.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20241005233308.4520-1-sakunix.ref@yahoo.com>

Fix checkpatch: WARNING: Missing a blank line after declarations

Signed-off-by: Manuel Quintero F <sakunix@yahoo.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index d3f10a3cf972..722522b25907 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1466,6 +1466,7 @@ u8 rtw_ps_cmd(struct adapter *padapter)
 	struct drvextra_cmd_parm	*pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
+
 	ppscmd = rtw_zmalloc(sizeof(struct cmd_obj));
 	if (!ppscmd) {
 		res = _FAIL;
-- 
2.45.2

