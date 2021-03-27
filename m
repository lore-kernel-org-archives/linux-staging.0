Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D1A70
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:20 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id d191so4385155wmd.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ReSq7CiQZ/ju2UCTp98oaJTGuxCv3z9E8iBZ94xxFEg=;
        b=lxS2iuUgkFF5dgKOupdwldpQwW5BBDOZCmA027NNVF2B9J2U8BJ6FX0fAkSxzYgUQf
         1ZOWPCRQIKID2hAXspUFLqzetjutzxFQ0EVRnZqhJa1L/ogTXpbfxsVcUf6jkgoU5WG0
         Nl/jurY3O7vUoFbz1xUFc4vFZDS98RsHGFZxrt6M1g2AyjXMBCXjzju9DW9Re+L3Lqti
         thEH5TJEC7Ef8ogaYzUHuo5BksIMO61weIwAnjDp0Ip+3nfa0ATY4MErLIOVnX090QS4
         OV/ELIQY/IziFml45nElJvibL/hkqt5wY/sT/z0CZWQ7sDcQ9pbsPxC+v8pet7K4qL/s
         BBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ReSq7CiQZ/ju2UCTp98oaJTGuxCv3z9E8iBZ94xxFEg=;
        b=maw6ycVYlZ0D2TQAQnX4Mnm58Tau/8aYRk0CrDWkjvRG0FP0/Mdrtt1EsOfJ41rWVK
         HPXkfRbRJeaI6UGW2MSmZTtxa/eIww44vUrgK8+QGAmDX0sXy+ilB7f/Uft3Dief2/Q2
         O7VHJUGz4+CxNFzDISJ7HsjrL60FDuYt07B9K2toVXe8r/bEoun3iMd1T+l+AXTXHt98
         AuDHSpM8GQzUctFAPx0kTPyHIClDiLW6VpG9jgTWVQUMMHYB1vbUt61XV8z1JvbT7y/3
         ZD9Ksw9r0ZKtJx68eDXekPjmQ38Ecl7z65qA7U8QrwcS41J35dKS5VW+x2Far4mLl+mO
         2Q/w==
X-Gm-Message-State: AOAM530fmDYqj0XeOP7gHjQyBEBV3aIR+0GdhjxwEzwaVEcpli3joipL
	P4Rfd6q/Qy07YnCf9ofZWbI=
X-Google-Smtp-Source: ABdhPJyVLZ1j7A0iJW/pn3zS7Bm0zLv4JwJu3faWbyc5KkOEP5EKQ9oxch3jCstT68BiWPrQP7IUaA==
X-Received: by 2002:a1c:9d4d:: with SMTP id g74mr10238921wme.77.1616855118657;
        Sat, 27 Mar 2021 07:25:18 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id h21sm15561232wmp.10.2021.03.27.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:25:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 17/20] staging: rtl8723bs: remove macros updating unused fields in struct security_priv
Date: Sat, 27 Mar 2021 15:24:16 +0100
Message-Id: <00c13a16f0034884a916855a7b7d782d6d05d4c1.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove macros updating statistic fields in struct security_priv

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 68 -------------------
 1 file changed, 68 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 44e2b362c867..0ddd7667a986 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -29,63 +29,6 @@ const char *security_type_str(u8 value)
 	return NULL;
 }
 
-#ifdef DBG_SW_SEC_CNT
-#define WEP_SW_ENC_CNT_INC(sec, ra) \
-	if (is_broadcast_mac_addr(ra)) \
-		sec->wep_sw_enc_cnt_bc++; \
-	else if (is_multicast_mac_addr(ra)) \
-		sec->wep_sw_enc_cnt_mc++; \
-	else \
-		sec->wep_sw_enc_cnt_uc++;
-
-#define WEP_SW_DEC_CNT_INC(sec, ra) \
-	if (is_broadcast_mac_addr(ra)) \
-		sec->wep_sw_dec_cnt_bc++; \
-	else if (is_multicast_mac_addr(ra)) \
-		sec->wep_sw_dec_cnt_mc++; \
-	else \
-		sec->wep_sw_dec_cnt_uc++;
-
-#define TKIP_SW_ENC_CNT_INC(sec, ra) \
-	if (is_broadcast_mac_addr(ra)) \
-		sec->tkip_sw_enc_cnt_bc++; \
-	else if (is_multicast_mac_addr(ra)) \
-		sec->tkip_sw_enc_cnt_mc++; \
-	else \
-		sec->tkip_sw_enc_cnt_uc++;
-
-#define TKIP_SW_DEC_CNT_INC(sec, ra) \
-	if (is_broadcast_mac_addr(ra)) \
-		sec->tkip_sw_dec_cnt_bc++; \
-	else if (is_multicast_mac_addr(ra)) \
-		sec->tkip_sw_dec_cnt_mc++; \
-	else \
-		sec->tkip_sw_dec_cnt_uc++;
-
-#define AES_SW_ENC_CNT_INC(sec, ra) \
-	if (is_broadcast_mac_addr(ra)) \
-		sec->aes_sw_enc_cnt_bc++; \
-	else if (is_multicast_mac_addr(ra)) \
-		sec->aes_sw_enc_cnt_mc++; \
-	else \
-		sec->aes_sw_enc_cnt_uc++;
-
-#define AES_SW_DEC_CNT_INC(sec, ra) \
-	if (is_broadcast_mac_addr(ra)) \
-		sec->aes_sw_dec_cnt_bc++; \
-	else if (is_multicast_mac_addr(ra)) \
-		sec->aes_sw_dec_cnt_mc++; \
-	else \
-		sec->aes_sw_dec_cnt_uc++;
-#else
-#define WEP_SW_ENC_CNT_INC(sec, ra)
-#define WEP_SW_DEC_CNT_INC(sec, ra)
-#define TKIP_SW_ENC_CNT_INC(sec, ra)
-#define TKIP_SW_DEC_CNT_INC(sec, ra)
-#define AES_SW_ENC_CNT_INC(sec, ra)
-#define AES_SW_DEC_CNT_INC(sec, ra)
-#endif /* DBG_SW_SEC_CNT */
-
 /* WEP related ===== */
 
 struct arc4context {
@@ -256,8 +199,6 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 				pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
 			}
 		}
-
-		WEP_SW_ENC_CNT_INC(psecuritypriv, pattrib->ra);
 	}
 }
 
@@ -305,8 +246,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 					crc[1], payload[length - 3],
 					crc[0], payload[length - 4]));
 		}
-
-		WEP_SW_DEC_CNT_INC(psecuritypriv, prxattrib->ra);
 	}
 }
 
@@ -710,8 +649,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 					pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
 				}
 			}
-
-			TKIP_SW_ENC_CNT_INC(psecuritypriv, pattrib->ra);
 		}
 	}
 	return res;
@@ -812,8 +749,6 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 						crc[0], payload[length - 4]));
 				res = _FAIL;
 			}
-
-			TKIP_SW_DEC_CNT_INC(psecuritypriv, prxattrib->ra);
 		} else {
 			RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("%s: stainfo == NULL!!!\n", __func__));
 			res = _FAIL;
@@ -1465,8 +1400,6 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 				pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
 			}
 		}
-
-		AES_SW_ENC_CNT_INC(psecuritypriv, pattrib->ra);
 	}
 	return res;
 }
@@ -1772,7 +1705,6 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 
 			res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
 
-			AES_SW_DEC_CNT_INC(psecuritypriv, prxattrib->ra);
 		} else {
 			RT_TRACE(_module_rtl871x_security_c_,
 				 _drv_err_,
-- 
2.20.1

