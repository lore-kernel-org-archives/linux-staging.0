Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C1EB8
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 01:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-35d67870032so40300125ab.2
        for <linux-staging@lists.linux.dev>; Tue, 12 Dec 2023 17:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702430356; x=1703035156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUXh09h2lQO8hg4DVa7lEdMbGciYtMpynkwHc3N2aNE=;
        b=NJtBvON3xiYjN+WMGyIygCpvKneiyzE/d4bGbT1UBdS9+2Ph2HSemgjNpNCudSTOP/
         /H+H2TtvTgweLV9LHFQzFeI5W8d9c48P6kUtVBJUdNNOlUAfo2VRImhHRpVVCgsg0Yz6
         ygjMIKOpiHaOVL29SuKiwqsNaibwBegAJjKX6SbpK/aq2+PNP6OFyvsUfwgw/z2NkKr9
         F9uIr9WBEVbDagG87RhnCw3+P2g3WvAAI6dM0t/Iwd5KrNXgsbyqXkhcheuhdPNQfA1K
         Fxuh3PTM9H1sWqjvaP//Dh0ZP0ILKrRsE1EJeZj9UCRm7F2ROE/DI6OA7HjIUzZ8mRif
         K94Q==
X-Gm-Message-State: AOJu0Yy6EN44f8vFI9gTvxwllE5sHjO18sKs/HVSE7b1wQ3pNzHycg0h
	RTiClEiYhIK5iwuZqN77q8o=
X-Google-Smtp-Source: AGHT+IHMr04vj0dJJgQ8mjNjKeiyECW7R4/yw/fE90/5IglQ245owAWpWj07njK4AgX+TiuiyA0jTA==
X-Received: by 2002:a05:6e02:184c:b0:35d:a8c0:8c92 with SMTP id b12-20020a056e02184c00b0035da8c08c92mr11355963ilv.99.1702430355753;
        Tue, 12 Dec 2023 17:19:15 -0800 (PST)
Received: from kylin-ThinkBook-15-G2-ITL.. ([111.48.58.12])
        by smtp.gmail.com with ESMTPSA id d3-20020a170903230300b001d08bbcf78bsm9266913plh.74.2023.12.12.17.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 17:19:15 -0800 (PST)
From: xueqin Luo <luoxueqin@kylinos.cn>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: xiongxin@kylinos.cn,
	wangqi@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	xueqin Luo <luoxueqin@kylinos.cn>
Subject: [RESEND PATCH-next] staging: rtl8723bs: replace deprecated strncpy with strscpy_pad
Date: Wed, 13 Dec 2023 09:18:40 +0800
Message-Id: <20231213011840.10005-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`strncpy` is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

We should NUL-pad as there are full struct copies happening in places:
|	case NL80211_IFTYPE_MONITOR:
|                ret = rtw_cfg80211_add_monitor_if(padapter,
|						(char *)name, &ndev);
|                break;

A suitable replacement is `strscpy_pad` due to the fact that it
guarantees both NUL-termination and NUL-padding on the destination
buffer.

Additionally, replace size macro `IFNAMSIZ` with sizeof():
|	struct net_device {
|		char			name[IFNAMSIZ];
|		...

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Signed-off-by: xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 1ff763c10064..90d521571f0e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2144,8 +2144,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
 	}
 
 	mon_ndev->type = ARPHRD_IEEE80211_RADIOTAP;
-	strncpy(mon_ndev->name, name, IFNAMSIZ);
-	mon_ndev->name[IFNAMSIZ - 1] = 0;
+	strscpy_pad(mon_ndev->name, name, sizeof(mon_ndev->name));
 	mon_ndev->needs_free_netdev = true;
 	mon_ndev->priv_destructor = rtw_ndev_destructor;
 
-- 
2.34.1

