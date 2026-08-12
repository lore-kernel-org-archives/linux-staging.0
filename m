Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C834359A6B
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 16:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550692; cv=none; b=eCGBWxNr0mNVFRFku51lFVHwXmLtaeoeI9X5GrVEzQXxGiEq92D9bmNKSZyD6B32wWzM7adYWQdXRPFnaKUBhiGrjPCpwWnbXojrzcuGriVqGTkvUc1vtXfJCLhhMoxEgrA0zZ1e/wMP/j4ykYeXHO/DhUKpQJWK64xNmRw16Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550692; c=relaxed/simple;
	bh=nzB9UYBLpfza64aP6E3AFcUd3dOOZ1h1qRUrw0K8cf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=HdgqvqQ0f2KZ1j6CgqxtTbLyACDfIxyshuBQPSerz1V8dnBhRgskH0eirfF0hUL9IscrLEWnnp7h3gvBvRV8wtsgazW4I/YG8TTLA/uYEPKBwIpzXtGt7SXWploW4K1FkXYc3t/SJmbcOIyAFexG6bfGu2V9lnDeq31MwJ0tzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=bsK4XpPs; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="bsK4XpPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786550688; bh=hvPvN8mNBO4BIr26sMGpYMa3sT07FSC5edGLcI3j00Q=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=bsK4XpPsXd4yb82jfnBMkUVNxp89afFMYzVeMG4cMgu1eTRnRavNr+6GmNAvEc1vWNsk087kVtg+iDNEpiNmy9dIT3wTTFm6YXlHq+8ZjsbLAXH1sCQ/dQO5HFk1yxiXhaFyrVgKzl+qA9LUZMFSxfvpv+3Qb1+2EN247s+ND+cXLr3Ucg2aK7qLyjjelkTbMFbb75AhThpfBC56ylBrpXjykBJhNm7nj/tjQBn/HnvdpN/7M4+D6CMf0vqymUbv/0H4BopXV3QVwMg8OSktsmH0fzkwssn9BZuyIpKgQDSoBwEGvM+rOb8Wg0BULfGhYw7K2nat/J57ksEhj1xAtA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786550688; bh=0oRIbcY6eShzdAX3OzZyz9daPmKUIQGzCfDQ5QCGY9U=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=I9klVcpYeAH9VerJ7dE8EYvZYcPtVtP5XPL6pwibQeoABuKyj2p8181qmIRMFfOb+wSFfPiQt+nVv5U0wRjLg9q6vxDT1W/bCSRqL9aElIe0FNzluAYQYJOG7QafZp1HXRO2ScwXjTVKzI0kKy/ZqI0wv1SOxE6qyzDepBMIgNf6IYNQ74AkxjUMd/03jJ1krkeGD1IOML82iCzMLZMQeQfpCUOLSLL97PFfsUWWL+YXZO7eIRozJVWA5wSQlqdoVDpaX3wOUKn92LWlQ+fkHptlrjbBb3Hyp1Mp0G8kbMIBTT52iOOuHfY3YTrqVSUA85z63tr4dW6iI5fEvgWiOQ==
X-YMail-OSG: zechqJEVM1ksHGvDzjgeNXVbZZPLJPZRw58zfh.MEUUZ4TLeP_95F_sQrQBmK2p
 7y6WuCtE.9NuI.Gvs5Nk3IJMVYEVPSMpkS6UCENR44pScZr2xvhbA6TXbcVkhbcve0OHFdB_2mXI
 xXDLOhoaFrfyymIBn9uJ1aPpvglmiJQS4Fv1nN5jAx1.47VZ8b0ARye9vGM4KvdpIJCD7eTjoRsh
 Xk5FHIZcF2eU1zlAdvDvFXMxhnizykZoOBFSYiD6q9CmSC0mel_rR114g0zJ95HvB_OTccA4u6eW
 AvoqScgGBvJAMhyP3x.cAV6G3Kn8Xdu7o2aRpTpiQuMDWc81FDNb7tHyQXjvZkxn6iWZhPt4WpIy
 PUXmGHPxRT3HAfx3EJ5aCx2XAmynZFAEmYsTN4Mi6vthjivQ3LXaGzVhfoMU1oqEPRCAcEnt1YEc
 W6aD83f7QMXFojqXPu27mYpPg5hXI2MHHeu8Ho5srI.NunP_o2AO1zG8UM9Y3mnhLGHyLQ5jrXDT
 U6os2QROlWDx40Q6wwMRcnfHX9sX56BWfgF0deKahSITRdvhoq95iL8erbMzD8YwimO3OxMXhUjB
 e2Y4_d1eLEi9gPHIQwKn7sD4XTo3b5tXJDQUeipGz_kSdB8Cx6FfMQipUkhN_AfwGCgzSP6nRM3x
 k_rIgjz.bs0xA55tjVTopUkij0vCEY9XdAkReWab13qXYRxU3iwF1yajc.eD0XpK8xv.JgLCfFSY
 XD.H2lwo7YgrVMV9Vyh02oSNEmEtj83Avexj_8RUu1dbZ7S74O_gnLTKr4kwNRxk6W158DLa7lJq
 MRoYVHaksEXrjdlfDDFoafBWOzC1h_bqCYmaaCvr2akBF9HDfvAyjauCGrE6W6QUA7jdzv1GQMz3
 yP1ZNMg71_KvzM7.8cV0.HRCmJ5gsPIPe4H2KGNBxF.1szwmo8Wq7Iz2EodoU4Awkrt2avOlgBdm
 eU0XoF7r1wdelqRgA12BqAZVJUqB2B5RJFnBVuHWK96DKYMYyd3j_Ri4Qh8t79kSg5rGfMolWMIR
 BMz3tevV8v3OBWNrOiFEUONkHUBj.vk1uA6N6wHr8M5lSzlYNNLdVAgGYlnBIdhaGFCogI9k41IE
 2Rq_EC0BpNowW5cDojEp32P0zPaA4.fXDRCcKvyl_XSy7otfb5iXSBYs9G34FlkcL1U3yZzvo4s0
 LBK4Dq.fpmeXxjb4ds3zKE2fyWoZ48._hh_qfVW24MsKUP7OkaWG_x3APo1GZbiIHC1_H4nNWc8k
 SSrjLyDZmC8eAju3EudTFYuUbpi3K.G7dH1g8XW8lXUZz1U_hXZjXmQi2swXPFt.O6g0s8nxD4.u
 VSO2XaXt5U439EIjPLoysv2iBW0BVvHUrfA9y8n6rEY0ilgziVt9iswrWX3jvqL_FeiU7ITmL3lM
 gL1HHe4jy8KNcBb0.bk.s.2Dup2QOtnJ8NHgA7PcTjS4fyL8h4BrNoBsC6FT2lVfh1vaf3VhAZFY
 SPAh9MX3yGFCagIHcfpNkR0z1Ew.RreJy6cOMjPRlDaePicmtA5.mdeGiq.WPg.wf9D2bTBFXDSV
 eCIuuJ_1CaDZt3i0jWattEMFz0hjGV8kJaRxryCFg5uUfOWww9_DYWkv.lXJz95chmekluCsKUaw
 p8q.FPRJxs._BkzYls9o5SA4avgEHDAewcbsoH6OaHgc_Q3.hRbGsjCyb7Zf4ei74todZAFsCHew
 yrxvJCcVbH87fWSlkA_AXH6i1KVf.L76GHGpPczbw7jbcBRTJ4VE9Gn15Pb6KQ5Y7Fvs0OPmAxRw
 UpQId_MRGByfhlxPvpUki9gMguvt23YMpttFadjPB.Hv74dTl9BdN1iVvGQOB1ow0wk.QjHCijI2
 3iqf5dHk.s1SaDCZHbnhVaMbmAqH72oZU_M6Glvy9jbJmCDwz4frPOf6dgPbfACTgpriwNiQBjQq
 5lckeh.x18bmMzNbjExxTSsXicowk5iMAh38WqaU4._86d1iQlJ5ghJaVaxkim20s5DURJxt3n_o
 9vbpk0MlmX.G19ADip8jHpck4k5VsFOaUmBZS6x.wtDCU3F1efAEBDo6xXziz
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 9cac155a-6fda-49fd-8c18-bcfc9249e085
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Wed, 12 Aug 2026 16:04:48 +0000
Received: from dip35.lsn.ir2.yahoo.com ([87.248.99.44])
          by hello (SMTP) with SMTP ID e9e7ab75542592e458d4d982442a217e;
          Wed, 12 Aug 2026 16:04:45 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 12 Aug 2026 18:04:42 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in wifi.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rtl8723bs-space-before-tab-wifi-v1-1-cde4cb359ccf@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNSw7CMAwA0atUXmMpMdBGXAWxiIMDRqit4vCRq
 t6dAMu3mVnApKgYHLoFijzVdBob/KaDdI3jRVDPzUCOehc8Yan3MNCWDW2OSZAlT0WwRsaXZsX
 kXR8yk9/vBmiVuUjW9+9wPP1tD75Jqt8srOsHeWaqAoMAAAA=
X-Change-ID: 20260812-rtl8723bs-space-before-tab-wifi-c1068fb21547
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786550684; l=2011;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=nzB9UYBLpfza64aP6E3AFcUd3dOOZ1h1qRUrw0K8cf0=;
 b=holSq71xX6c2oizcHeysz32blkqTeELXpEJbyoiRkDy7e5FXWbWm1TnPKz323//Dt7B3OUvqY
 /gHe3qdbuqNDcrIt96GK+kf8mYSOzDZi1cWxjkFPukzyZMJlqDVebUo
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260812-rtl8723bs-space-before-tab-wifi-v1-1-cde4cb359ccf.ref@yahoo.pl>

Replace space-then-tab with a single tab between field type and
name for ht_param and basic_set in struct ieee80211_ht_addt_info,
ACI_AIFSN and CW in struct AC_param, QoS_info and reserved in
struct WMM_para_element, and dialog_token in struct ADDBA_request,
matching the alignment style used by the surrounding fields.

Verified with checkpatch.pl that the 'please, no space before
tabs' warnings were present before this change and are no
longer reported for these lines after it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/include/wifi.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index c8844e2bf7b4..ea2889b195c4 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -329,10 +329,10 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
  */
 struct ieee80211_ht_addt_info {
 	unsigned char control_chan;
-	unsigned char 	ht_param;
+	unsigned char	ht_param;
 	__le16	operation_mode;
 	__le16	stbc_param;
-	unsigned char 	basic_set[16];
+	unsigned char	basic_set[16];
 } __packed;
 
 
@@ -357,19 +357,19 @@ struct HT_info_element {
 } __packed;
 
 struct AC_param {
-	unsigned char 	ACI_AIFSN;
-	unsigned char 	CW;
+	unsigned char	ACI_AIFSN;
+	unsigned char	CW;
 	__le16	TXOP_limit;
 } __packed;
 
 struct WMM_para_element {
-	unsigned char 	QoS_info;
-	unsigned char 	reserved;
+	unsigned char	QoS_info;
+	unsigned char	reserved;
 	struct AC_param	ac_param[4];
 } __packed;
 
 struct ADDBA_request {
-	unsigned char 	dialog_token;
+	unsigned char	dialog_token;
 	__le16	BA_para_set;
 	__le16	BA_timeout_value;
 	__le16	BA_starting_seqctrl;

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260812-rtl8723bs-space-before-tab-wifi-c1068fb21547

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

