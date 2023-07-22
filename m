Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04697EBC
	for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 21:58:42 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3489cd4e3d3so17607125ab.3
        for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 14:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690063122; x=1690667922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQTls//O2JbbV17qPpJETi4oaKteU3qRCqIMmnS37Jk=;
        b=aMv1PRqcY/jg9COHkd6El94rMTQ5QhXFtV7Y0YnSaUpZuBEuTB6uPZ/EMeE6+GGYXm
         rXiznG5q5Ooqm5OFEVNF6cJKBMp+si2Bj+DAStv1u1NqKn7CmiP+p8MSUc/0dNORGuwz
         eQ8z6oEB8iyMBuhyQvQ3He9e5tjO3oY5U4MK/+miimYpiq3b4rtoQmj+/jw4jYryIjxd
         /fe/DAo8UT9ger+lpDhMjm0m3oXOj6Grv+vIgJZ3eTSEExYdcP5NFoOUAoTARDSiM5dx
         qA43JoZ5taunpD6JsgZGjdhfd3rnAU8WxC4XH8R5MOuEwKWB0YIegi1YAs08MlEFVJWP
         Ekag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690063122; x=1690667922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQTls//O2JbbV17qPpJETi4oaKteU3qRCqIMmnS37Jk=;
        b=lSnuJmRaDNRbUzeZAoqrssiQ4IdfmsukTcUlwnS8nwaUo863UoWo2J2giQpeNY4iBI
         76+8+SE4UkTs/RiNJrA8Jpz0WXY498UTSOggCJg8CJ0jRjkYXFtYOHbvJUZs3iOwK3mW
         bGSFK+O0T9nnsrX30XPJ0tlJyy/eXiF7ROjcYLiYF+u6jCzTvQMwzLV/M6EqEdoewJdw
         upjj1SkBtMm2KzCJkd2dYErGWMBy6+1fiitombSW+pnBtdppQ0q5JrgEvkM1pW1XxWYh
         pUR1y8swwIwQed7kzZNf3DPit5MfwhOSb1dbAD2A3RnBfyy7APmQHKkDMKO8MSZna+Ac
         pzuw==
X-Gm-Message-State: ABy/qLavel+swwFuvYTbvAKW8fOPZ+SINFq9gG+k9ozYPCVyccE0Byo1
	kEWtFabiIHOFsxjwpTzmM60=
X-Google-Smtp-Source: APBJJlEKpsqcqDHLPWl1bfVv7gwOvVfdJeCwqkQoN4M8KHFx+7ASnFDEOXhlnWjjQ6FBHi8//k+1CQ==
X-Received: by 2002:a05:6e02:1cae:b0:346:77f4:e22d with SMTP id x14-20020a056e021cae00b0034677f4e22dmr4151199ill.6.1690063122039;
        Sat, 22 Jul 2023 14:58:42 -0700 (PDT)
Received: from localhost.localdomain ([161.97.244.155])
        by smtp.gmail.com with ESMTPSA id 17-20020a0566380a5100b0042b61a5087csm1878723jap.132.2023.07.22.14.58.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Jul 2023 14:58:41 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
To: franziska.naepelt@googlemail.com
Cc: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/9] staging: rtl8723bs: ioctl_linux: Remove unnecessary blank lines
Date: Sat, 22 Jul 2023 23:58:40 +0200
Message-Id: <20230722215840.4323-1-franziska.naepelt@googlemail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
References: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch issues:
- CHECK: Blank lines aren't necessary before a close brace '}'
- CHECK: Blank lines aren't necessary after an open brace '{'

Signed-off-by: Franziska Naepelt <franziska.naepelt@googlemail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 16ff55d75687..cde2c5d1e92c 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -40,7 +40,6 @@ static int wpa_set_auth_algs(struct net_device *dev, u32 value)
 	}
 
 	return ret;
-
 }
 
 static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param, u32 param_len)
@@ -80,7 +79,6 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 	}
 
 	if (strcmp(param->u.crypt.alg, "WEP") == 0) {
-
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		padapter->securitypriv.dot11PrivacyAlgrthm = _WEP40_;
 		padapter->securitypriv.dot118021XGrpPrivacy = _WEP40_;
@@ -392,7 +390,6 @@ static int wpa_set_param(struct net_device *dev, u8 name, u32 value)
 		 * be set.
 		 */
 		break;
-
 	}
 	case IEEE_PARAM_PRIVACY_INVOKED:
 
@@ -429,11 +426,9 @@ static int wpa_set_param(struct net_device *dev, u8 name, u32 value)
 		ret = -EOPNOTSUPP;
 
 		break;
-
 	}
 
 	return ret;
-
 }
 
 static int wpa_mlme(struct net_device *dev, u32 command, u32 reason)
@@ -462,7 +457,6 @@ static int wpa_mlme(struct net_device *dev, u32 command, u32 reason)
 	}
 
 	return ret;
-
 }
 
 static int wpa_supplicant_ioctl(struct net_device *dev, struct iw_point *p)
@@ -485,7 +479,6 @@ static int wpa_supplicant_ioctl(struct net_device *dev, struct iw_point *p)
 	}
 
 	switch (param->cmd) {
-
 	case IEEE_CMD_SET_WPA_PARAM:
 		ret = wpa_set_param(dev, param->u.wpa_param.name, param->u.wpa_param.value);
 		break;
@@ -506,7 +499,6 @@ static int wpa_supplicant_ioctl(struct net_device *dev, struct iw_point *p)
 	default:
 		ret = -EOPNOTSUPP;
 		break;
-
 	}
 
 	if (ret == 0 && copy_to_user(p->pointer, param, p->length))
@@ -586,7 +578,6 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 
 			pwep->key_length = wep_key_len;
 			pwep->length = wep_total_len;
-
 		}
 
 		pwep->key_index = wep_key_idx;
@@ -623,7 +614,6 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 		}
 
 		goto exit;
-
 	}
 
 	if (!psta && check_fwstate(pmlmepriv, WIFI_AP_STATE)) { /*  group key */
@@ -671,7 +661,6 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 		}
 
 		goto exit;
-
 	}
 
 	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
@@ -694,7 +683,6 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 					psecuritypriv->busetkipkey = true;
 
 				} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
-
 					psta->dot118021XPrivacy = _AES_;
 				} else {
 					psta->dot118021XPrivacy = _NO_PRIVACY_;
@@ -752,7 +740,6 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 	kfree(pwep);
 
 	return ret;
-
 }
 
 static int rtw_set_beacon(struct net_device *dev, struct ieee_param *param, int len)
@@ -777,7 +764,6 @@ static int rtw_set_beacon(struct net_device *dev, struct ieee_param *param, int
 		ret = -EINVAL;
 
 	return ret;
-
 }
 
 static void rtw_hostapd_sta_flush(struct net_device *dev)
@@ -856,7 +842,6 @@ static int rtw_add_sta(struct net_device *dev, struct ieee_param *param)
 	}
 
 	return ret;
-
 }
 
 static int rtw_del_sta(struct net_device *dev, struct ieee_param *param)
@@ -885,18 +870,15 @@ static int rtw_del_sta(struct net_device *dev, struct ieee_param *param)
 			list_del_init(&psta->asoc_list);
 			pstapriv->asoc_list_cnt--;
 			updated = ap_free_sta(padapter, psta, true, WLAN_REASON_DEAUTH_LEAVING);
-
 		}
 		spin_unlock_bh(&pstapriv->asoc_list_lock);
 
 		associated_clients_update(padapter, updated);
 
 		psta = NULL;
-
 	}
 
 	return ret;
-
 }
 
 static int rtw_ioctl_get_sta_data(struct net_device *dev, struct ieee_param *param, int len)
@@ -956,7 +938,6 @@ static int rtw_ioctl_get_sta_data(struct net_device *dev, struct ieee_param *par
 	}
 
 	return ret;
-
 }
 
 static int rtw_get_sta_wpaie(struct net_device *dev, struct ieee_param *param)
@@ -995,7 +976,6 @@ static int rtw_get_sta_wpaie(struct net_device *dev, struct ieee_param *param)
 	}
 
 	return ret;
-
 }
 
 static int rtw_set_wps_beacon(struct net_device *dev, struct ieee_param *param, int len)
@@ -1029,7 +1009,6 @@ static int rtw_set_wps_beacon(struct net_device *dev, struct ieee_param *param,
 	}
 
 	return ret;
-
 }
 
 static int rtw_set_wps_probe_resp(struct net_device *dev, struct ieee_param *param, int len)
@@ -1057,7 +1036,6 @@ static int rtw_set_wps_probe_resp(struct net_device *dev, struct ieee_param *par
 	}
 
 	return ret;
-
 }
 
 static int rtw_set_wps_assoc_resp(struct net_device *dev, struct ieee_param *param, int len)
@@ -1085,7 +1063,6 @@ static int rtw_set_wps_assoc_resp(struct net_device *dev, struct ieee_param *par
 	}
 
 	return ret;
-
 }
 
 static int rtw_set_hidden_ssid(struct net_device *dev, struct ieee_param *param, int len)
@@ -1144,7 +1121,6 @@ static int rtw_ioctl_acl_remove_sta(struct net_device *dev, struct ieee_param *p
 
 	rtw_acl_remove_sta(padapter, param->sta_addr);
 	return 0;
-
 }
 
 static int rtw_ioctl_acl_add_sta(struct net_device *dev, struct ieee_param *param, int len)
@@ -1162,7 +1138,6 @@ static int rtw_ioctl_acl_add_sta(struct net_device *dev, struct ieee_param *para
 	}
 
 	return rtw_acl_add_sta(padapter, param->sta_addr);
-
 }
 
 static int rtw_ioctl_set_macaddr_acl(struct net_device *dev, struct ieee_param *param, int len)
@@ -1293,7 +1268,6 @@ static int rtw_hostapd_ioctl(struct net_device *dev, struct iw_point *p)
 	default:
 		ret = -EOPNOTSUPP;
 		break;
-
 	}
 
 	if (ret == 0 && copy_to_user(p->pointer, param, p->length))
-- 
2.39.2 (Apple Git-143)

