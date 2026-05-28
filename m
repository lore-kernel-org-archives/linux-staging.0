Received: from sonic307-53.consmr.mail.ir2.yahoo.com (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33C03B47EC
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962089; cv=none; b=XO3bMpnT86rtPNEbbeeBd6REaFZ+I9tZiMQ43gD7/iLkAPqpgB0XV7ftp/GJaOQd1Tn6q/cS2kM5VJaL0CTU/pNcYTqIQ+DTwLa4N7xs70zYVF7+xNbjM7Q7rv361V5x24ZETSAqTE+hnTNDq0//keB+fl3/qRh0Xt7RoThlLZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962089; c=relaxed/simple;
	bh=vh3LDoGFhmFesVfAmcwsG162N9hVep89oDm3LkqWxEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=YTIV1WlGUnVpk5h/XkiCD7xjfmVeh92IacpObGOokRXLBKvdWnhHEyoANbMfDOa4fB5grJZ/0q1ibF/58sN58viJjdsFZwWFdusZ44QXInNNU2TI8qyKkIot1k5UFw8hBM57jFVU/px2fUHfF8qrxrbc5D0x0v+R5WceUZEDqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=I1Uz5GiK; arc=none smtp.client-ip=87.248.110.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="I1Uz5GiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1779962080; bh=7zcF2m56ILRKXigLl03FQD/Goze4FHAcsfOPd8NXnMw=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=I1Uz5GiKTuqpwhzLXKCYMczTCI2JRNNnOZBC/lVT3Qiq7lHmlO0QYyD7Yy04Q0wWoz78OHygn6jqvorB10yuSxLUf8+kkyg36JnrxNX9ei8Dd0cV/7R7arYysxUafT6WStuQ5DHGxo+6BodXEqxajx87T6/syx8vpFzBqodLWQaWjrFnhlOqgJBE5zRfTQBkUOK+VhkeOa3GYP5oNonMwPylS6tJ0FrJfbxt8A9Vg015nhKSURZiQubuflxSf6cvGhy4ZMOChW7XKY7PSdZp4dNp/eo2QtxQPQMTaQ6dd85xwLL2P+n9iS8ickzwGCVNOOFII17OYPEWZs2IsJlXlg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1779962080; bh=pEC1xMVKu+TYnzDPzqUuGCmFuaL/YE+8rA2ZEKSLyQh=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Y6hEi9en66eXEilk+bLmVqXgWEX+TkwSd4eq1nh1z6Ey28TSbRw7Uugt809kXhfuA7QTw52cDA1g/2B7w0doO1VjpeBXl6fQobwKA3px73qdtJEDy/eAV1zOy5JiluE6O9kycISuyYTxljqP4xkMx+QBLvurhW2Fh0bjbNAwUu0TuAe/x2oFfr7kug8DFmEOY8wmRVFd7WVA80h7f4Kbhe9PCoJucXrQ66t1qYXYpBaHsS+5VRJRZg6I9V02TXjVppqIpOVT2mNV92IS2XTmQ3cxNXIUmiMqQf8jo5NKlumsADwKhAVKBzPM6a56OkmdP3swXSrPY2le7pX+BIqrkw==
X-YMail-OSG: 2A3vWFoVM1kcRishIeYPL5ebnZ_0xviDtYjtRoyMsCARCTKu8qxVgwd1km0gQDi
 oOye4PkItsOSK.ofa.__sgfpk9aEf_lv40hLJSSj.xAnLFBslinwxyA1IZhpCRjvEc2wQVdjGrp4
 zCq7.R83THnLS.V1oam1N4BfOSNCYhSZ68rg.MO.5oPU8vqJPHDFdXFvRfW84kbQXzNfICeR_.nK
 _DftE29i1MVUtlg0.FHmkRGEFxIqBrCSfSRXyRgaq8mTZGTfoHRgnfH1BWXTYnUVJ8G4T5xlvuwo
 5_dZnKDSaDKG9IAokq2x_iJnZLVgU7e9ZZLibBIXS5haBDmlmCj6KiETa6uoUSugp6ywQfutK2Mq
 sHRy71xlpVJ2ziTq_IZgpJVR74w3KUoYC3N_4fypFAhVJPw99_d0DRBepa26n28vU.bJqrg5UIvA
 4kWYrP06FjFvdzlI.s532c2HkfPFO83NTh7EPRFAC.ad9jrWIiSTN4cKG175QBndGTb_Dp5KDmHI
 oPIGXBshqh0xzqq55pilA9SBecqw_ZQhElvUppQs22o7HyBeqUSIH4afIAOnzaC0BILPQkgrfP5F
 VvSgfbcdk.aJkQcowD1H4c3j3YcbT5qLn6gNtYdOcNsEAoG_2g9SoqbNQxHxLyZmDjuMBi7eNh5O
 yg8_1yQYkC10TeELseDQ59sMVPFqAGjVgIws99UwlSbMAKhet7eLQWvVGNtvGNYERmTiUt6eFKBg
 Wg93.vcJGIZ61zUsAQ__SF5dymo.mQndWDTymqmj.rqCTEaaObFCqHzTJpbbpf_Ena9LbqGdzFu9
 oQ.yBzjOjYCALweg1C8h0t1xMXmch2qsZoWvIRX_4_GCllIWWQ7ozF74VBGDsT5o7qBnracWMT5_
 RAMgnpFHvhHA__l0XihBoPed2LvgYQGBUN5.V79Hps6e43vZZw2cGWORNaiIoonU6HcREefemA3K
 UJB10gcvZP2IdmvdY5IlPkFXcU4GRq3QMfHJeDN1tFbEHlTPJ1hrdMZVFuNsc2uQVL0yrgeQ2CH.
 9VEGA72zEh9Dvg0hn.Q9eDVKh04G.hY1mG2V8e_y_q9t_0yQbIxiwXEltoamnDyyGXme3pOXFfIT
 SfSTgf86UeL9dmrAPREIvP.2VtdyDVhYYMPBLUVvWGXoE0EzecwH69pIJY3l0wSLFL.om4MhoIEH
 BgfbJn4blR.nxKJSNuBv4W_sKgyYzRel4.YbC3wWtQugH8NFmiy67gwy0uR6veRLvZZbvEN8PEUe
 KaZrkN162._bwEpuF1Ph7L5CL1YXcmvY2D3_6bhqAQo88sd6hZ5aLM5EnxGxWVSI0JfzffOiPd15
 nFoy.7SFX0ynyH76bSCwgnhJXgQWw7JZwNNV8ba8wxeyAQmU86fuHyi581ADgmpr41ZgIU3hdNl6
 lHuPRCCg05Jfqhr2mVDbraV4_VCocqwRKKMabInF.WdllOVcGRTLyObE8YH6T00VS.hVq5WFQ3t5
 yFP8OgoOwBoZq4yX8PecJV5AvVbLWG98CuQFWHot6lse2MkidCTpg1igYxzmbHMgrP_weMlQ93Ba
 Ss1Xw5cVPOPiVoqntYaTpboQWbae8rNpMaa85xp15k3i0It5AKLcWpER4bwZxO_oHKsM_FmZOwfz
 7g_s5elROo44bIQoDXXnA1q8mMm_IlBqPEhLsqEdstncgOmvIwhDIsY1bD9nHlxIPlV9mno8D.qq
 2omtvy2IxI0xPYwX0FjD_2laRB.pqGuMEFRJ5teekRDsvKTfpgPr4WEuCpfdnpUmHNz0T3vrARwy
 h8NfVUs2gOHO8m51lY6MCXeDN7qLk9JTzwYFVm8X4TgUdHoE2OKVtDWEfwCtmKLafBTAL7U_ugHR
 GBeJB4MgdiNyM4XvDx3UlPb18qSZffNd8voVNIDz_s39PreR5hM7d3zsN_MUtWG9CAYls5UuSXN0
 h94eWcJYRSk89xJ9jTrYRfsUMc9HD7ZFd.O1w3SgP9fWhV9FmgjdDQKpDlTZrabbUOVRDUAvwBgp
 ALstiBNeocG7.lpuzGNj0f.MmIv2iAP2wjEVtkBC_edYBdNvs_fuOCkl9oKXXLdL5nY5Q7Ft3721
 HN4iUc4p2_H2IeHUIhdhIMhLf9pP5_6OHjxGdNlRc9QuSCNSBJdwmAxMcJ74yozUDw0fxjG8q5.I
 eA9OZO7NoQsmslabYLHUxoHHFR6PM8c_1Yvp_Iy5Ql70KPdXu0eMDZB98nJfsop5ZG4vPxvEMTQH
 6zsoHC6DK_5iIqEMwJiuTvE1opneXnQKz8Jk6KgIyQf2ZZCe2oXAroHmxFkx92hd_5A7EHi9s6do
 S9dM79HqwJ3nn0Jef12OYyp_x9GreDANliFdiLMwU1zj080dzRekBCJob3GGv.zoZ
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: fa56defa-b9d2-495c-83f7-94b85c8f6bdc
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Thu, 28 May 2026 09:54:40 +0000
Received: by hermes--production-ir2-89844b765-gkszj (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8bb97838cb81fe5e40cb95c04c0f9a35;
          Thu, 28 May 2026 09:54:36 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 28 May 2026 11:55:42 +0200
Subject: [PATCH] staging: rtl8723bs: remove redundant else after return
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-fix-else-after-return-v1-1-f07ea0f010fb@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAB4RGGoC/yXMUQrCMBCE4auUfXahXYiKVxEfYjrRFYmym0qh9
 O6N+vjBzL+QwxROp24hw0ddX6Vh2HWU7rHcwDo2k/Sy74McOevMeDo45gpjQ52s8CAScjyMSCF
 T+74Nbfjrni9/+3R9INVvjNZ1A19iqtt5AAAA
X-Change-ID: 20260528-fix-else-after-return-1225fa7dec5f
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
References: <20260528-fix-else-after-return-v1-1-f07ea0f010fb.ref@yahoo.pl>

In enqueue_reorder_recvframe(), the else branch after a return
statement is unnecessary. When a duplicate sequence number is found,
the function returns false immediately, making the else keyword
redundant. Remove else and fix the indentation of the break statement.

Reported by checkpatch.pl with no remaining warnings.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e7dd..51536f155750 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1789,8 +1789,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 			/* Duplicate entry is found!! Do not insert current entry. */
 			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
-		else
-			break;
+		break;
 	}
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */

---
base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
change-id: 20260528-fix-else-after-return-1225fa7dec5f

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

