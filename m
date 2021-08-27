Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFBE3FC6
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 12:51:46 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w7so4726811pgk.13
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ImX+lEaSLVHqZqeaBkJ+uFMURgXjdXd4Hy04paLGmRQ=;
        b=lWvXxEcl+wUBeQvpAN5BDFR3ErqdZX7RBoyb9HtmqOJQAwLFGY99pPmPPhT/OfP+Ac
         4onIfbzZVheFnzp8S+breGr7p0VQmR2ZJsMYBhHW7BdNQxTfZqND9ffiCfM01hdrQdrM
         mgctm/7iX4NBeQXCiKCpbAiX2cgHPpnmCkazhafECMZCek8mXcV7IrcF2yCerK3A1JMj
         jfsj6WS6ZoDfa9FhqdK9ByIkwycSSACzgMfIO9o5P8uq9D1Q2zFNENsj4F9Z6XJvkbRv
         lxp4g9kv+tzMxPeR4fBDgiDRDbDXil8NAdU14tq8SjafJTuvoz+x5/JLP78/8btREUKi
         kcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ImX+lEaSLVHqZqeaBkJ+uFMURgXjdXd4Hy04paLGmRQ=;
        b=Z/IJzl9BZ7/ABeIHK647UKQwDnJfIRz/reV3qCMIv6kKMoYMZrXz9T1efcuo3Ux1kh
         1x4Wej6/uqfnwB+wwksMs4/qmMGfJQ1+zQ9E1PRmCFPKsC+IzxUW5wZe+uDk9MWnEgzW
         xuo8grdzcnoFvmAWhrQXP4zo40WajOnnzHa3TotLCR75k4MSsc/3e3/VN4QiSqWxRRNM
         M/HIhLlGKZBwW7Q8HKJuWUa7bNezIu2gGB+ioqh0mei/lBi3bUgyQnxgPhIsfuWVGn32
         pJSy0VcokNYSJO1F7wVitq8K6vptGMKAzMAnU8aYmSdx1lyGdu8wyzUEw6ousirtB68c
         AYCg==
X-Gm-Message-State: AOAM532Q7nXmM80wx/OwVeIkUf9uKvOPGGc3AJZ8YstNjSG7Cz8evcFr
	R1ormVw8o8ONmFa6LWh5p8E=
X-Google-Smtp-Source: ABdhPJyGbOM6XZ9I6eRr5sx+i8vS4BGkS6+oR72LHvZ7bMs2tmSEOH8TnG4FELGLnhtDIvWleEAXOA==
X-Received: by 2002:a65:6883:: with SMTP id e3mr7852361pgt.90.1630068706346;
        Fri, 27 Aug 2021 05:51:46 -0700 (PDT)
Received: from localhost.localdomain ([112.17.247.23])
        by smtp.gmail.com with ESMTPSA id n3sm6236982pfo.101.2021.08.27.05.51.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Aug 2021 05:51:45 -0700 (PDT)
From: Wenlong Zhang <yixiaonn@gmail.com>
To: gregkh@linuxfoundation.org
Cc: fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	insafonov@gmail.com,
	cyruscyliu@gmail.com,
	yajin@vm-kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Wenlong Zhang <yixiaonn@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: prevent ->ssid overflow in rtw_wx_set_scan()
Date: Fri, 27 Aug 2021 20:50:59 +0800
Message-Id: <20210827125059.26694-1-yixiaonn@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <YSfjtZsISLH6cktF@kroah.com>
References: <YSfjtZsISLH6cktF@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Commit 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
fixed up the staging driver rtl8188eu by adding another check
to prevent writing beyond the end of the ->ssid[] array.

Resolve this by properly fixing up the rtl8723bs driver's version of
rtw_wx_set_scan()

Fixes: 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
Signed-off-by: Wenlong Zhang <yixiaonn@gmail.com>
---
v3:
- Added the changelogs for this patch.
v2: 
- Fixed the description of this patch.
  Thanks Greg KH for the review and guidance
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 902ac8169948..6fc1020cea11 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -1351,9 +1351,9 @@ static int rtw_wx_set_scan(struct net_device *dev, struct iw_request_info *a,
 
 					sec_len = *(pos++); len -= 1;
 
-					if (sec_len > 0 && sec_len <= len) {
+					if (sec_len > 0 && sec_len <= len && sec_len <= 32) {
 						ssid[ssid_index].SsidLength = sec_len;
-						memcpy(ssid[ssid_index].Ssid, pos, ssid[ssid_index].SsidLength);
+						memcpy(ssid[ssid_index].Ssid, pos, sec_len);
 						/* DBG_871X("%s COMBO_SCAN with specific ssid:%s, %d\n", __func__ */
 						/* 	, ssid[ssid_index].Ssid, ssid[ssid_index].SsidLength); */
 						ssid_index++;
-- 
2.15.0

