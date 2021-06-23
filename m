Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016B32FB2
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 23:49:18 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id j12so3482948qtv.11
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 16:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fz6Uuyh6sRmvq83eP2Z1h7AResvYGcXTWKNxvlCvilU=;
        b=zhFyFp1kwMjp+G+eb/qWIFi/JNiYlUW5yKxkVcyinMlVwt1NCW9C0QAHrd1hfLfGay
         xnGn1wZdf6uytsznzm4dtQmkvPBGkGQ7MK1jPI2Y7iKq6ykVN9Dqg6H2YXFp14t2e2fK
         R8NEslmeu/E5yWKHhGOotP3dpiriJrlVR11tVlolo1B3AEUo3mIlmhSkXIWiubGMWb4o
         cm12yON1VQU/FKPnzuceLMmCg0Vy0Bw4nVjbWKpNeT7WVXFEV8M79pgYXNfv54fczRI+
         7Bl1neqNW7ZomHTQ8cEslQE8mg1wQc6wPi9bbHNgPcIHDGvXRi22lLq3PqPC+V9pA3XR
         +4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fz6Uuyh6sRmvq83eP2Z1h7AResvYGcXTWKNxvlCvilU=;
        b=tdHjqLlBwG7d7+eV4Wwv724dJDY2X4eGxd3wwN3gxH0/ej0qXod1+Y2Jw0WOF1z5oA
         eAOTSZGelgEc3gZ/2ODX6NZyOjWSK6qD94WCu/w0MOQB2JvlXgPyITalVj9rNSj73IFz
         mHRgnm9wJTPoLBPXaMNuG7L148ZYt1Qm7Pu2q5tyqVviYZMGYUnFlWIIQiy7Q/M5Ew09
         6BGD5gfuYU3QO0V+oQq/aZjg4IhbK9PhoHhbaeoc0ROnltbJmne3lfkVbVgzkaEMs0qg
         Roqmy471BBC3w9Bgb8YBYLmwmLAQ5jmnOh0EXjMq3Ads93PE5GIvMXUeWjwAylZypKt6
         YyPw==
X-Gm-Message-State: AOAM530KoMckDZWhOQoQnNLlMyYiU5qwhY6x2tiG9ghYWmxDNTBRchsV
	1e45bJSJGvq3koqGS4LDXWCDjg==
X-Google-Smtp-Source: ABdhPJxMcsRNz95A3x0PY/7qIZy2+HXw+OkuF80368AT/Un5zI7k69Jrp+G/6rSvUJ1hZTTA3qJ8OA==
X-Received: by 2002:ac8:12c6:: with SMTP id b6mr2341172qtj.352.1624492158164;
        Wed, 23 Jun 2021 16:49:18 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id w2sm992387qto.50.2021.06.23.16.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 16:49:17 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 8/9] staging: rtl8188eu: remove MSG_88E calls from hal/usb_halinit.c
Date: Thu, 24 Jun 2021 00:49:01 +0100
Message-Id: <20210623234902.7411-9-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623234902.7411-1-phil@philpotter.co.uk>
References: <20210623234902.7411-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove both MSG_88E calls from hal/usb_halinit.c, as well as the
unused local 'jiffies' variables from the rtw_hal_read_chip_info
function. This macro is unnecessary, and removing all calls will
ultimately allow the removal of the macro itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index dcdf868b394d..093aa4ab3ad4 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -1056,14 +1056,7 @@ static void _ReadPROMContent(struct adapter *Adapter)
 
 void rtw_hal_read_chip_info(struct adapter *Adapter)
 {
-	unsigned long start = jiffies;
-
-	MSG_88E("====> %s\n", __func__);
-
 	_ReadPROMContent(Adapter);
-
-	MSG_88E("<==== %s in %d ms\n", __func__,
-		jiffies_to_msecs(jiffies - start));
 }
 
 #define GPIO_DEBUG_PORT_NUM 0
-- 
2.31.1

