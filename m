Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F68477;
	Mon, 20 Mar 2023 21:22:58 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id ek18so52259286edb.6;
        Mon, 20 Mar 2023 14:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679347377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lqRaegmbeCf2kbh11GbjLCZS+M4vcbsjfGajJu8diwk=;
        b=KhVSFpFXeulhrdGaxWNRz3NWL6uI9060cya9RKxF6xj9+59whgTzAtpNRXSM5MExAe
         R3CFwHvHNs+3hPz5Ev4g/3ckzc8ovdGdMGNd/49XY+iLw30PzPPDECL1dZf+TrXsmHIz
         Gyuf0LONalf4ge7eXIzz0qpe1ZTzVjM2SwMwDY2VMNNrPmP+mPlC9hO4zceMMFFpjOnO
         V6WLLDPNuh1GKWzPHH4phe3gloEaI/oeO49/HkAiQ4nJMSb1hhO/wqo6EfOO41BgRjIA
         5boPel7mzB1qLYlcJNLWWAVkPqAyb0rgHprVEHogNE5Fi5R6Ct7aWjTdNHHYszLrYfmN
         vucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679347377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqRaegmbeCf2kbh11GbjLCZS+M4vcbsjfGajJu8diwk=;
        b=0rksSIDSCjMJ4vufKom+tXQnv8dmfvvQYikKSbrb9+OMhTS0lRFO0pjE4cpGDAUSLF
         ctNNwFby4ZEUygV4+TJasNcQ/Nr3Ch9kp9+Q9AZzgw+Yg2y+jhCKuI9em1hVu9XuSZC7
         zzwj3NMeN+iZssH8jwNmKhYM0WTv3/Oz85EZfnK09mAdK2BHkAr5LCFPFQyp0tTKZR6j
         9dFBjfD/TN1mVEAJIm6gEwF+vDc1MYnezXEsnXaus5he2lv5JrbECvyZ7Zz6ftuDwyCQ
         GkFxCROpZTlJkfzfvVZveSgUlVS0LgdLFJwagUjpr+lppd+d771cybVO39tEPcCDhz1r
         9umw==
X-Gm-Message-State: AO0yUKX35gKk8+7ld2uZg3FxI8qbkqrGzYVHVkSuxuWj76T3bx9MMFty
	cfpnI6lfzhORL9fY476GI6Q=
X-Google-Smtp-Source: AK7set8T1dbl4BU/G/2eVqCdpbq0D2nos11d4yxMGWJR+Um1h0wZ05P7DWd22lA3C8Co7nznT/kpug==
X-Received: by 2002:a17:906:dfea:b0:930:9cbd:4e88 with SMTP id lc10-20020a170906dfea00b009309cbd4e88mr555049ejc.8.1679347376960;
        Mon, 20 Mar 2023 14:22:56 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id hb6-20020a170906b88600b0093120a11a5dsm4924159ejb.92.2023.03.20.14.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 14:22:56 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	drv@mailo.com,
	dave@stgolabs.net,
	yang.lee@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH v3] staging: most: define iface_to_hdm as an inline function
Date: Mon, 20 Mar 2023 23:22:39 +0200
Message-Id: <20230320212239.22452-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert `iface_to_hdm` macro into a static inline function.
it is not great to have macro that use `container_of` macro,
because from looking at the definition one cannot tell
what type it applies to.

One can get the same benefit from an efficiency point of view
by making an inline function.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
change in v3:
        edit subject line.

change in v2:
	edit subject line.
---
 drivers/staging/most/dim2/dim2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index b8bd01ca1f11..21d1c9f24c3d 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -108,7 +108,10 @@ struct dim2_platform_data {
 	u8 fcnt;
 };
 
-#define iface_to_hdm(iface) container_of(iface, struct dim2_hdm, most_iface)
+static inline struct dim2_hdm *iface_to_hdm(struct most_interface *iface)
+{
+	return container_of(iface, struct dim2_hdm, most_iface);
+}
 
 /* Macro to identify a network status message */
 #define PACKET_IS_NET_INFO(p)  \
-- 
2.34.1

