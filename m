Received: from sonic308-18.consmr.mail.ir2.yahoo.com (sonic308-18.consmr.mail.ir2.yahoo.com [77.238.178.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349538D693
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 22:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181354; cv=none; b=IzbJ3WBW7+OdKFXorwrEDRbqkwbdR/0hNHR/y2fTzOAHHpSw+aM17kG0Xw9nDmHHjB823WY771RA/S1PE/ZXDlwo6fSxk2PLuu43MOz7ZS7xtzYx1qoQf9LsoEvnLZa04xm70aP9Wlle5iXC2Ntlv1z3XAsHadGdj8HJHDc7sdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181354; c=relaxed/simple;
	bh=uZD/UzAHq6/yCSzhoQAGpGw0t7XJm4al/sD5aeT4sdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xy8Ya9KDci2JAsZ/iippkDorgCWgTzxNlI6IJO5Wx10zBSyashjrcQ7O4riDmr2E2LGT9jPeKhWzG4Ltckk6R0SwcOY8beoeH3ks3HDphRge7dbapsWn3/SSs18JTvZEbtk68pZ795wyGvA7WSLm6hnHjARijPcC/M3zJal/FzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=WBcVy9Wt; arc=none smtp.client-ip=77.238.178.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="WBcVy9Wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773181351; bh=y7phk6+RNaKhWHuL08NBQGnZAtiW/SmdQ15PNHMkJ2Y=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=WBcVy9WtQqkqq6uzWJbfudDXfFEQ4MJYEYTJuC5r+UmiUQZAPkrxCMtNTENFJs1vQRRhrSl1wixwa/05SKDc/HVW0W7gERYeZnyV5MiBG2pb9YBlKGrXTsAebu6KApDPpAbsrKHKcGiC9sVo3Acc7xWt8SR84SwiLD/BGr6W5//vzTf2MrZY9+yDDsl35AwpwR5mAyXZCMlArPFD9oIevZn/4lFUuNOuv2vVwR5yOqZAyAFCVvFodCQLnDLnjZyMzYoKLLN+TqIRWIvmlMc4BJIfMuXzhZ31OGzEFvXI6b8CWWqNPbl+DiuMTm+ni6UN9oRMG6dpkht80wv4bnI90w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773181351; bh=kqn5KfT2szShIvmKirJhI4HXUZ22S5gikGO4WbRFxMN=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=U7Wj7iXi59TGxRk6KzYLZJePYmBbWJfuXyZuoTD4RnxzE7FTf/3l/ac17yj8PN5P1ifWYbgRs3LuK0L6AT25u6xEWhb4LDEnc0MlDmOBF3d44kdO5VLe8voRwncSCw+PlRc6VFob5XI+JQV/L47uJIUOPfFcPpoD7gov++JQ2amE4XaDpYd2EcAaOKeZHO/Nv2i3SGWFQ0+pPFptfrZu/T6LnM34YAB7a6SRBVr++nL51WMJacg2OxnYRaaUMAUykfZWblal0LyZJp7bUSyHYq1giV5qFHEheKx0NtEFWRjHXHRe0D9/uhlk3cqFHZImIzXLJ7ogmsymDFo2IQdhdA==
X-YMail-OSG: ahHoCagVM1mRvwruo_3y95AUlnH_L7az9o9oBuk3ZxzTeGaidyNZakJ8mDynL1E
 X5sT2BpKTJjKw50sc1wP_fjzsSWq8UIu25m31c2lsCycxkdsodWm9xGOfLDECO8SwUIc9ZGyej3x
 OgHF7BCUoLAp3wlZuq4ldW4IGXPSi2jBNex8mHZTj41.wRu5upUkMi5XtS2oTrVyqhecBfibOEbk
 rgSyWxjJbJ5bXDCLYgxANIw9NmVnTT10Mwn3jPUaxq1OWxaZQQ0d.d.Zm0D7uc2m2lYR3lAz6bEr
 z.6QTpoHkhPqT5Yd0osYIZOVwGf6UVFzl1UTNfbU89L8NF0.Gg3PrGgGJsv0vkBL7ifDAP8eF1HG
 ZkhwTgxeLu1ZFDIn8IWLreZY0RKx46e25W4atUsjGgEbBdKo0YPkLzURyUOdxJrtBHs1tce5iT1V
 asjtBAGzz0JONPHIox5oBPJ8VajAhRPNpjxHmguNEL7NvxyrlSvlRbqSxTfCX6o7Lj0j5NWDb0Bo
 7N0jfVza5q8AN_Oa81XE2rgFNODHLLrHiHzQ.I2ZpUhyC8d5yEj49FAUJN3to80zNGyCKXClM0W9
 ejiMlLgLevDgrvRnzlFdx17FLsJcpjwBpUS2I.GFsFVt_169ea.rRsP2_m.VdrgjGyV9HpAcoLwe
 qEbH2AIwZOaiWh4aPy6uH9gcbMTM63OiJ6F_zkzm7ucjC2RcW9ZOCG5ZSt9xBY7l7eoMzs0whtG0
 QrfqRqktRTVw3jppk3bTV_lIAwQLXsKmBR2QX4jJRNxf_EpLNo1OuJdWU5sH_qzbfyqOjzoyd_O1
 _A5BWgBzLSq8aVywfhk1QmWBqknbZXP33fbNsUm91fJmtH1k3Qa8a4GTBvFX0M92JEChgIRq8_3w
 2BFiQIjetv43rO4IYYYr9FHl_x1OtzH257_YDawZhUh2ytnqe.N65bjo2qxnkrp69xVBVmhMJQ7b
 EmJjNAXPCR9Al7Ipl8_hzd42dqz3efSusr5RJ3u4kIoe_Fc2aXivsWtNTklAaoZ7zDCcG1.oAFgS
 RJ.aTdWT4nxtX.YTc3BAjCG2iZbNXap3gdk7ZVAwIM8yK7CDUbtRsumy.dBrRKmXhKYEnhmQFrcC
 WYhuDo3sBJ1JFEy10Yhi6aH57hthjjmS_.Luwf14GbF7tC8m6g_c9UYpdFT1oSp_G.8yfn5m1ZgF
 y0_jI.HrnYwKlObCONFmGyPykQTbkhLw4O9rD7P.xGT1RfOxNzX4stGRnVo1vK8Sf3hEjqbch_Jc
 TPKeVdl1RxW1iI5Z2v09EL1BIcLCz2NMA7HCeERm7Hk7S5uhmK0y6s1MKW6UN_.SNcj1RM2mprZE
 hdQzeDCjQWgMFpd9wGjbjw7kQbvfDSlni8LjLtJs2ejD2zQe70FgxjQk4_tsswxkI13m6weFL0PY
 fXmY0SM3gQU8D6WBiNwXNAiR1EgNJF4oFqsVCH5XvW9mOWgojn6UPsOmiNMEiaG7sHlXFG2Ichn9
 NSSx30ziJuoNRp2BI3iQObYQvJ3gC.iTUwoZXe78Oe4WNjV4Y.MFNEMgrMH35iM1vMZgrBkPA_6d
 gb.LfMQD8lrCcZvFYjctPIels8xQgVXI4jjndVRFzM1A._PCBzhKTBRBPbSNfaKa2rxAydc3tUIJ
 L4NSVdw2i4YDkr4B_sqsRur.Xl29lEQ_H09iHBsj0PHP3sQvm.hVuJtuG81XvZMrmHkaVe58VcoI
 1_umMf5D42qPsit.VnqLX23A4Q05s9BB8U0L3XDzPA_yfxzqzT2C06sEJ2haQl7RfAR9DlJHyBt5
 Hzmoq6u1B1JdY_sQ78ojMyBcYYR2R1LjLSq9ihkswlLBP.a4hIg_DnjBgCUxH53JyjuLL9oYtqRU
 iecnpgFdivN3f8JZJjPN1SiUlx.na_op8LWsPiYr0oD4sAIhTo1ukm6DnZjR0zZoekgAHR_7sKiD
 8UahYYfpeZ3BkwYkBUqzAGNXV59A1HCjptM234F.JHukK1RkdQCSzj21dVsVhbk6.kZhvexZc9Bf
 7VGznYhQRiythmSxjYz3W_uV9yaRPoJbDXNwWhBlJ_ELpt7ZHe99iJD2wOYuydYBtT6otqODNdiW
 em3q1YHjn8yL0ePd9eVSzzdzRyrZnU3Rp4caQncnYtxghi9V_RclBqvTXDZDK8njZLOvD453awBW
 vsgph8gYwUlvYUc6ebKdHGkcVN8bWkZr3Uth7RLB3o5pjyx30xrAg230SmIbmFKXEcP3F6EQj9Wi
 fqpSE5Pj0goCE2POjfD7pjjUCNTosPzWMEP2rr_.cP8eCiclyzRubuIJR..ySxwkul8QFFlW4M5e
 ZL1MwX2RAsZjcloQcxEYO7tdjtYQ-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: b807a68e-a036-4fe9-bd19-6661f501dbaa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 22:22:31 +0000
Received: by hermes--production-ir2-bbcfb4457-4sf65 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 48b5c4a15ee0780b19eed7b75aa629cc;
          Tue, 10 Mar 2026 22:12:23 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomasz Unger <tomasz.unger@yahoo.pl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 01/28] media: staging: atomisp: Remove unnecessary return statement in void function
Date: Tue, 10 Mar 2026 23:09:45 +0100
Message-ID: <20260310-atomisp-remove-void-return-v2b-v3-1-f2977db216cc@yahoo.pl>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Remove redundant 'return;' at the end of void function
ia_css_dvs_statistics_get(). There are other similar occurrences
in the driver that will be addressed in follow-up patches.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
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

-- 
2.53.0

