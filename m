Received: from sonic314-15.consmr.mail.bf2.yahoo.com (sonic314-15.consmr.mail.bf2.yahoo.com [74.6.132.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E023D9533
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 02:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.132.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031322; cv=none; b=JWCKva3NUjZFFo6HKz5LQ0IJyHdoRknXsUv4upSs46MFaxdQc0TuU4JduMVr/ow6Sdk06QsQcYinroYw2+jFqwBdaUYWt0dGm9VgOv+C9JNfh1KJUnDILtX4dwLb963kl9jyVB1kVSqimth1qbvnX4UC8qmMdnshbjNNctCZYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031322; c=relaxed/simple;
	bh=FrZMG6dwF5b9arGcrds1qVDsPbbuCoxjL26ju5FedYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=SX3KPcLg1eurB2owroF5MOrKJcgyeZc/bpp9uIeh3jnoqljaD3eEEIFBh5fyar8Qwtt3dOvUxPWGGqdWRGMuD/Tz3uFzU5EN46nIsEIUir+FImepaKp8pDsYnyB5qJUIAOFMMuk8IuCiXGsZs7z///HVwDTsSgPEdTC2Tk36o/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=dn0i8Crl; arc=none smtp.client-ip=74.6.132.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="dn0i8Crl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792031319; bh=MgxG+mLem+szq20nkrLyQXPX8ghWB/8DnFyxNKXjZNk=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=dn0i8CrlLHbqr9hpGP0j9d0yYwVUca/xrq9s6cjIOv4WN+Glpjd4wdMv9RYdxkug6+tF9YeTp37MtexOjMdFgC8/VrtgyPP97of13cyrsu7AMcakQ13IhGN39fmvenHLbEKS3pLkIEOVnucJnWZpnV1sj+M7A4LhRgrUj8gFJ+SUBNiHn3/hnWJg1xeGLBYg7wdg4L4GeEnX3Q1FqsazYRp6S1rvaGl4d8idK7p6uEFGcRcHCYGblGoA1cE8CHyuFxdr+MMSM+W00kkj3EdDuqlYoGf6cnOkwOeWI93Q5qvb9iIkKF51q+Rrflnfn5NA2cNfpPOUCJ4A4RNNMMbrcA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792031319; bh=w3/060WoPJhOJKNKn+pHHYL2guvPxn+wqAw2JLCmW1m=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=MglvhCxMoUdmlZQHV4gDTjjyodR1TUsj5sGLffh5tMH6PlCRi7zLxa45OaJPimJ4lgX4rbufr9UbCuvkP8CQaNFEdBAUl6cUevwJvBBWoEAVbYuBFcDB9qsZMJDWCB9M09wrqcr2Mzt/GCfHr9TVMbTy6XTQ6rV5MburNZUDW55t4t/bT36u1lf6ABNhoterW2f5BvFffxC1NjyzgF/UYnUrOmP7U9aSCXvQgVBcJKIW52htcsPykT7fST0rzFhVn6vBm/a8aFPVOpqXPJjF019MrmQMyWCYV2PbumudeowLjXN0ERoLtsYKIeP04BBn+QIuAz8nX+aQa4GEuiMRvA==
X-YMail-OSG: l_MNo0MVM1k3rV6LVbt2zz9dSKY59CdBNs.WjO2VSCfwRdZTvutjhCWYAtBtmPi
 hc5f_FPiSqhtiHzvBswoRwEA9cEhVjvPm8om47NQ_UVjEY_6GMsGB7z6GM8GiJGEdpt7MDMoJf6_
 LUPlHmwKJmzAsM8c0C2rqeJjiOwQgrxvwI2_UI1O8kQFM_PpUDOszdrGirFZxURf2.TcbjpohDX0
 O3XcR32hQGz.nDIu_HHpbx1bws64XUKj3RYOHh3D1ZNv.NO0jh3d1tfrsnpgwNigur04ctv856yX
 ygy2TrP3ETG_9nGI.LfLjCnYTFZtaV042h4dAYYIIdzdxCAYfgNrqY2hF18ZUxZXUKlXSm23QTdK
 Eey1jh58l.RCIb_5Vgq_ziGh.64wT71wHGwYJvurVO1zJB2ZvOZkKhgtTFr7v0K73r4d2KA9ZsnI
 _LgxvGN.y.hdZOVaO7ZZRSLory6zT2ooD2zOEOpjS.kzijQlXwyj0Dq1w2Bwqirh1wZoCYirWKOO
 ziI8zKXfPWHHtaABUQrQ3ughgNYdrGw0hfxjPjawq0zg6cgIJoscJyVasOmHNH5iLzlawP2afTP2
 alS63_aM2B3fqrgr1dpjKaMeD3czy.qeU6YsMgh7rEeeYVIoNXaxjvqKRxUhzs0wDkfMr6uNNnIe
 5akoT9GnoSqthdzxbx8j_onvnykqGB9xHzeZAPBOMP1x.gmKZY4oIGAMWO0iOkyVRG80dZJQbbIe
 4edpDrR6CbopWLl4EQ2KNfG5fPeAbbMQ0QpAcd5F8OHHrEd3EglgDEEvJRSzrpTb048p3dvPxycm
 iBSsS0FUhk76.mvNb3bIemAqMVpA7iZQ409sGakkmpV9IO4vmKdQ0O_mBIcQDRDjWkzcjBmf98P5
 MmtxEpHMcVvvGrEnnjouNrkjXImpudh2q4NFnLAUAahWWWh0ui7mMkD6jp3K_K2TUCePEgxXa2IF
 XWNMY42Y5LAOXEydcowqUvRuoAJiLJviMu1wu17AaZAB2F9CqPAYeKLHlBxy6s8gXrg2N.E.Ggee
 Icd_bv.S9v6yxXhoFbphuMgG72tVcWCppMRD4bwP1AUNrusOmrIQqMoUsuuCs4VvNo9ixhShNX4P
 qujLjF7KbXydJ2.hzsj_Wotsr6fJhWE6AtIZTt7M.h_CwlkIbzMhbN6VJX3f_qLyitOstE9drbq7
 QIzm2dSxxC9rWB3WsrxMjg6b.9E77h9_zPjkMCh1AbbfH_FArokUON.NghQe5917w7U3MfZ4ndDK
 Y.A.zotpV_.lYAcrPIyr0D3TQ5aBswUa4SMoYOG6KaVV_XVJlStCjmQgebDyKmLTELQ9o7pG0PmD
 rp22ZI9KBrlnevsPvqCJufvO9BEjFcfdXUD4EBMvkfHzh6ut7QhzIZUY5in831HqwBGxK_RYMs4u
 tlOWQL7i_d2KrfxxyxX5Ry8xcFHuQbLdq_SVK0pRbFyyZRwwQOwHRZettoX7AV19ctDDzHVNlQxw
 Ve2oWsMLOphbnU2UVRmjyUkXVo18nPU.qrfADQVhwtPvom0LxFfSHqu3yZOB1SN62kga8AKZVuFk
 svuHubmeaXWNAI7fKVVEzSmmQWAFP.NlkSJZA0aDATUGFvqQCMmrJrBD_Fn2mUPCeLqHzdZdwgPp
 046DUPp8sC2Xce7iaLjsNQVIcHCtNp3QPF1z9BFZW5jF2OEVQoOWoPZetoB3hVb5knC2tjYOgiGI
 fbU05eABm2CVktTeKY5uE_25k1H5BMUNazElBWsRpFeLA.RXjJW9xlmOOi7V8J6jcFyfy_y8miGz
 _XGBd8dVlmsnLf6cewlSc0w.JduNuSGsbE633pjE5MkbvhqE1_0ZYT.H5QmLZYAtKvv1lHAxbkco
 1M4FhPHwEFdgp1n827SldjdnWGI71mCtaxNUtDTR4JserPRGpHG75GcNMmnJAbE2mIT0I07kPNsE
 PqU0AZfGn8J_XoPVc1dKNkUGFIUYw5C6QWilruzcldgrckW1lk8N4I_Fc.PkDXBWj9skXI_NthgI
 hHzqMzfioOMhe7rQB7qFGLoINQ4kw2lsPBe2rBV3htH64LGfAyIQkcsx_kvYOQgP5KyhBouFAvhj
 kzxuB7mQhMy6TI6EsAc1tkEI9C.XpU_kyCiwHGSuzkRzf2bnU21Akf7W92rX6uOIsGkJ7H9AknuL
 1DzdZKuP8.fYyscsLcpx7CRh6iLuwSb3fvYglUK499bcZonh9w5TzvEBbkFL_QrSKrdq_PtBTo62
 vJDSVdfNnqxhegsf9TR7VOHNCUNZ_uX9jmUeEX9rbs7nmtBgDe6dFSZGcq01_m0iAxgp3zw--
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: c2c8a19b-404e-4d83-90c1-be944f15de40
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Thu, 15 Oct 2026 02:28:39 +0000
Received: by hermes--production-bf1-6d6877594b-jdbq2 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 270e6cdc05595c28d78c31e33ac35dc3;
          Thu, 15 Oct 2026 02:08:00 +0000 (UTC)
From: Jeremy Dean Clifton <deaner92@yahoo.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	Jeremy Dean Clifton <deaner92@yahoo.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: greybus: Remove unused header declaration to_fw_mgmt_connection
Date: Thu, 15 Oct 2026 02:07:31 +0000
Message-ID: <20261015020731.98150-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261015020731.98150-1-deaner92.ref@yahoo.com>

Commit 3228900f80c2 ("staging: greybus: Remove unused function
'to_fw_mgmt_connection'") removed a function definition but did not
remove the function prototype.

Remove the prototype.

Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
---
v3: Change to imperative mood and write in proper English (Julia
Lawall).
v2: Fix grammar and spelling in commit message.

 drivers/staging/greybus/firmware.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/firmware.h b/drivers/staging/greybus/firmware.h
index 5d2564462ffc..04a67d2d5b8f 100644
--- a/drivers/staging/greybus/firmware.h
+++ b/drivers/staging/greybus/firmware.h
@@ -22,7 +22,6 @@
 /* Firmware Management Protocol specific functions */
 int fw_mgmt_init(void);
 void fw_mgmt_exit(void);
-struct gb_connection *to_fw_mgmt_connection(struct device *dev);
 int gb_fw_mgmt_request_handler(struct gb_operation *op);
 int gb_fw_mgmt_connection_init(struct gb_connection *connection);
 void gb_fw_mgmt_connection_exit(struct gb_connection *connection);
-- 
2.43.0

