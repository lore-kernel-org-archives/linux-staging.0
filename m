Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF413FC0
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 03:06:53 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id c14so8922243qvs.9
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 20:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v5fKUirlI0ToxpLo9nwyWF9xy/b07uS0bu8mkFdXJJ4=;
        b=erFyBgVd6uxfFcX3HaP8t0NV9C6E9+O9C3zq036nMZmOJeE28l8RhqShZNWLiExlv4
         B7lhIdJbRlqm88xklXIFutvI1WUZD0MSU9r8uZz2Kujayh5RFGAp/rmXtCylpm50uh5X
         U8ZqW85w1t4F7Z8OqlPZ6vvgKPEZf68kYvQUl6OAMBViieV2bEsgypEvvIwCEC68ogXW
         uvdU9oYM5GY9TQIGCtQtqyINJhs0I5yvUcrN19Eymu+yk3ePxFv4mW+dBgMbOQTH7306
         Apa9LWKvSsCyLrQBz3uFydR99dPBWM4P+6jcIx21kAorYhGLcoLazisNLfnmlfJwMtV+
         EpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v5fKUirlI0ToxpLo9nwyWF9xy/b07uS0bu8mkFdXJJ4=;
        b=USiF+RAY73/FLbNsAVfzZWMaFWI2MLdE0XHTYxMTTS6qgZ6ljlWz4gK+k5Fb2z/v0v
         SjAJWBVD1ibjO6YZ/IbbWCruBqaKK4w4QdmAMvudv4oFp2SoDFoz7jL5Z/sDKwh2Ka0F
         FFQm/6F2IqJlamZOkBtl0Mknq4IDHIOV5RlQQRxZS1M5twciuagwbLrPr5mHCUJGKw7V
         NDGFkl5oxySTbdDMsKoMNx0bFMigaqMBvOpyuCB0TY8CfXj9vlPLx/MNv4QfIhS1Q9D9
         roFLzNkGtFTKpu/Vol6z0LD1R5OHqHKTJd5s2xEf8unW30xssABG0e43fWuvJtVj5QMk
         VqWQ==
X-Gm-Message-State: AOAM530huDI+vHO7jR6jFu2wtj4FUXcoJ9YqyausOi0i73nAlC0ovNIH
	NdCdDF/ZKwDy8/BhKsBmnPI=
X-Google-Smtp-Source: ABdhPJzRsbKxQw9ePN3HS0BDfYjIn+EEf9EgHyOKBXJe/2rwM6YTMtOvUOmTjsPOe8ROkRKup5VqYg==
X-Received: by 2002:a0c:b216:: with SMTP id x22mr31272965qvd.55.1629688012820;
        Sun, 22 Aug 2021 20:06:52 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id j18sm7858882qkg.31.2021.08.22.20.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 20:06:52 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: xu.xin16@zte.com.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xu xin <xu.xin16@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH Linux-next] ioctl_linux: fix a potential NULL pointer dereference bug
Date: Sun, 22 Aug 2021 20:06:31 -0700
Message-Id: <20210823030631.45517-1-xu.xin16@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: xu xin <xu.xin16@zte.com.cn>

The pointer might be NULL, but it is dereferenced.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index a3e6d761e748..ce4ce9190f5f 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4389,7 +4389,8 @@ static int rtw_dbg_port(struct net_device *dev,
 				pregpriv->rx_stbc = extra_arg;
 				DBG_88E("set rx_stbc =%d\n", pregpriv->rx_stbc);
 			} else {
-				DBG_88E("get rx_stbc =%d\n", pregpriv->rx_stbc);
+				if (pregpriv)
+					DBG_88E("get rx_stbc =%d\n", pregpriv->rx_stbc);
 			}
 		}
 			break;
@@ -4401,7 +4402,8 @@ static int rtw_dbg_port(struct net_device *dev,
 				pregpriv->ampdu_enable = extra_arg;
 				DBG_88E("set ampdu_enable =%d\n", pregpriv->ampdu_enable);
 			} else {
-				DBG_88E("get ampdu_enable =%d\n", pregpriv->ampdu_enable);
+				if (pregpriv)
+					DBG_88E("get ampdu_enable =%d\n", pregpriv->ampdu_enable);
 			}
 		}
 			break;
-- 
2.25.1

