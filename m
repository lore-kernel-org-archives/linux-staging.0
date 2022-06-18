Received: from sonic312-25.consmr.mail.ir2.yahoo.com (sonic312-25.consmr.mail.ir2.yahoo.com [77.238.178.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC27B
	for <linux-staging@lists.linux.dev>; Sat, 18 Jun 2022 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1655541182; bh=kSar2hWiBkoVOEa4noYo0cNiILJDpvElY8v8U36VPZo=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=jpcDaaZHGyb9a6gwAzk9cTngS8Fadnvqfzhg/I2g8tnB8oD2Wvo/OyHP3KG0Jm6CoT8d92S7Mn3S36XyAgJ9gnVJWuUAD02yrDDcLNlx6/cak2/kcO7pKfMVq38sQomn+XCjKO7mSOmb51niiBguRXJkUCYnmToF+eBgJz0itC1XWRJn3VxwWLDqfc7jT1cPIjTMAA1UCcaqHlE6i7BMT7n64QrvrV37NZDVpAY67i/74MuAH5sCVw/7o1CMutNQPf4sU6uc4lIoXAUT2QkKPM+h+aCBtXHOP+VF7q4Pk03GR2joiLoCr/c5KxX/v8WQ3nNTn+RUUrIU3CIARrxEbw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1655541182; bh=mMpEco0/RyiMRSR+CN6di6+o2SRfbyAPlBuzuayFEUk=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=JyN9XApnMwWAMTTpJpf5zgO8L+C49WQ30TfmsFXYzY0oztKE0e+uUcClu8MCRvmJCQu/GoNzbabjcRcxBfaVgZZP2la67Z9cnOn9GIRwRyB9+qfnHD/u0HF5fQJ1vYvg+2f9I/qZbxRDqI4CXbvX028o3NN6OrclAhbagGtXsVAsavdBqPP4Cr/nF0CZIARks38Ziqy/RZ1YBAZ4+muz0nuSc//VXTZbkzCo1W9w1qKnUuMgB/Eg6MT+Pn0iiuqr/Lu7/CSqynMl65CCxAcfspcxOL917emKbclSubX2lQj/68/4ECFWrVOxxZbziQ8XzqWWiK6lyWvprxNBbOpmQQ==
X-YMail-OSG: o3c1XxkVM1knUENTURr5r5vuEUdJBVQmx.hn11n8X_5r__xZx7KaXQ.QcDYW4vD
 7qm6IGiup3NLIX03P130BVheE6MX.JwVYNKAF.X6sGua39B7TVqmT5VLHsGG_yMlpYW47ARfJafi
 cRAl0pGwIKgjc.30coLR1fTZKz4JJtOisWcJ8gnYsLU0txgwJ6opqf8DMl9BpSI6VozdEsLQOtUj
 zYY_.4B613YJRB39ehbsme.1Bo1ngSPD.vmjcKAS5N.kYbmALjEnLXiP98eGJHnhQU1cqySK.aby
 xXsVAnkknFgeXxXkxwctfNK6wxLeZ0.xu7cMpuiz5Y9nf7fOY2l0aW4UxZLnQYnZKMwAWTvJORSN
 FlpOk9QPvi8KtlOUPY.U6Kk4e5ibTnwKFJYtAr_Sk1VEEoQiD1.JkdKfArNBudWf7CgCS0G5hSxg
 BxoLjZnH93jWwdLex0uJNBea2g9tM77NjWIac6g9pbFRmztlbaC1i9kTaUx7Du8tWZLAdwNqEFYN
 ziSVqRmpNtagPok58DqK1rQhgnJWTgY11tDo6GqtJaejdmJ5VGq7WYluKUWbpGFiMNOG9zIfw0jg
 3oOA6gAhfm7Z0h9ifEO0JwbSHHROH49qYwd.57v8KGVFCbciHTGfSH6pT1YUMCv1.BEbC_KQ_qtk
 Un3QAW3IMKHz8bHKtmGDZTbVhjkxFM7eN5fM2HGfuxnUuCAlxQRdU4OtemZaeJewR4MnnfG_X5aJ
 6vnyFydvdzfyp3TEo.fz_z8aEl7MHWdKhuelTdHYhyISigwJryMkszUbUoz32oyqdeiFWT_h4KO2
 VbsaAWEt.Bh7bJtAPPWPZ.QfcF1THMy4dlphPCxkG6c0L8Eyw_fD_fUV7DdLGGZLfHYAVtJBSgZk
 N2ehOO4raGIltJWLh7W_2i3f5iAqn_vMYJy4a5FDQdsSTyQ6xKmkBDap8G74QFVGlnV7QD62WfhN
 wAXX5qJQYheyr7eDkLiEL1Hfmm3AI_qss5b2.RgPrqC5768lGElIHvjE6S5G4Z1PAZbY2dXeyqKB
 6aWYRRgDdeo.l3SP1G9Uv7tm4MX2Xim7ijTnKmk26LrflylhSO6E9Vw9wKmBSlShKO7HD6mZv4Fx
 _6tKs.L3hTBw0KggOlRj.F0jEBm87TD7VkuQT3mlojDnDch8hag2X6VcGUeCFNb8EqcQjcf2sDsa
 BYHG7y794UY5CbwOrUZjKLjdd3olsI1TDBp8X7_S65688GR7QMt174fPSQjAagvxwNmqK0CVgx1o
 mOEX9Su.Wy6OXJW7rdVjou3ISgZqYMZLXUpo5xBZTobDgwccEQs_h1GhVybHyK_txhUUFr5AqHs8
 DdNuNUd_q1JT5HqJRc3idht3Jj07Bb_JPvlbc1LjPtOKHhxAUXMD.tdyxKNK_kELyUZRLHxYX7wB
 CHQnA7lr3To.h7qXYyNRmFjmbJ_fR3tW2rSqtRHHjfPVYV7kf3pP2LdgQNmUbFtOFdW9CJE3LWeo
 Txn3VQUAVmxUrEgOjrYI.AxYKK57H0XpX_NXJW28R4Y7TpI7uvjmQNQdDCCVphwWsPt6uioT8RFW
 3UceY6c.7WW3Q7sIPBLXn1euumYlCfcrWyL8IexLebw4_aySC275QBiX5Uv6MMvtLpFy7rW9mMIz
 xVXXTHkLfW.SkC3gjIVB4UtlubrihrA1oNlP3IuYsIC59B1VpIoEavOCn7OmxRTmgNX_CdLtXtsO
 mUnxl31XjnhMNFkxYBPo1zt2NEZKQDEwujJiz60iKCtRgm91KpE63iiOvD7uZo9mFdjrnqbc3ShR
 bXOE1gdxsbWsvXQNNa15EZ1KTRgpb2FyYsr89PEq.IpQGNVkEwevRfARpa1NbE6gC1Y1Fea9MnKA
 9jzFnnkA6l0SDsK7ckuElpf0TL8V3YPqi5fRuky7f8m4z9tfn.VL6UPqMXJG3Mt5HsVcPcDoIzk9
 BF3uc0nQ0HvAfHNEKRqcecSxDrqTfJJfzVNZ3DWsW9QYVqbUkCiMGBbwiNlATF50pxMUK4r._u94
 Ag4CswqSn7eWHyBuCYA9.gUtHxO7Qupny7Rs8Qlwyu0D8AM3xBCT_KS8oXTfHqmlh2lZvW.XZbCT
 qge9cIJY8pLo0B6Qf6ZngqI_acjp8Wyv._87B5dksfP2MqTBHD1iHMBiSFkHk6ibW.Wzh30LNtbj
 _Hq1bGShBkffsQTyt2NoNsgTHozNQOdXwMcfkNG3Li3M-
X-Sonic-MF: <petersenarne@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Sat, 18 Jun 2022 08:33:02 +0000
Received: by hermes--canary-production-ir2-c9bf9d9bc-brwkd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID efded038e7861accead3662d180fdfb3;
          Sat, 18 Jun 2022 08:32:59 +0000 (UTC)
Date: Sat, 18 Jun 2022 10:32:57 +0200
From: Arne Petersen <petersenarne@yahoo.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: fix CamelCase function parameter
Message-ID: <Yq2NufHtWbuXCjWE@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
References: <Yq2NufHtWbuXCjWE.ref@ubuntu>
X-Mailer: WebService/1.1.20280 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Change function parameter in header file from powerMode to mode,
now identical to c file function declaration. Issue found by checkpatch.

Signed-off-by: Arne Petersen <petersenarne@yahoo.com>
---
 drivers/staging/sm750fb/ddk750_power.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 7002567a47d2..63c9e8b6ffb3 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -15,7 +15,7 @@ enum dpms {
 }
 
 void ddk750_set_dpms(enum dpms state);
-void sm750_set_power_mode(unsigned int powerMode);
+void sm750_set_power_mode(unsigned int mode);
 void sm750_set_current_gate(unsigned int gate);
 
 /*
-- 
2.34.1

