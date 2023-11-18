Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AC3F4F7
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRjylFq2"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53db2f8d193so788567a12.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 00:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700297510; x=1700902310; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3T+DN+4X901BSZo7/K9QB8FTvLJTfF9SbWoEo2JZ34=;
        b=KRjylFq2D2fhOmilYii5D8+CdGXoprIaMMLTkSlaSOPlP8Blx4Um4K1WyNtc/LyqA3
         cxVx8moyrd6OLPxUwxVJ/1lbOspGoKVZe5AKNxESq9fMUwwuH2CnODZSr3wYCcBkj/PD
         h+gUdiMcl1FlZWmCMrw/88bL72FHU+KuzynSw+Fbs4zMSrKqfvFz1/jTjqYgXI8CHpD3
         xJyWOyo7KMgQZDYllGQMqltrnHDiHAKc8fsHiV1Wde7oR5sc7PtujYiWYAUYmfWn3D9t
         8nzzz+IFkIzYQAp4aubZqrwUJlvAC4LCGcfKn6H+9YnWSDI6GkNCVYbEYCSHrfWj2FiV
         3deQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700297510; x=1700902310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3T+DN+4X901BSZo7/K9QB8FTvLJTfF9SbWoEo2JZ34=;
        b=H80ybQpzohP/Xh8HgFxiKLAddygP09ozGvpbMdQQI/v47V16t+p1/7n2C0A3pg3kb2
         U6WQZtF9TE1Z0Ty3qOt00t1HhjLwZoC0LlCn6kFEu9KgNWE/l/v8v9/Ak0oz0Ac150EQ
         ZqYZK/CxjTiJbIDs1eEcMCAmS9LaYUlJyV33t34wZUoV7/ijommShmPMGEdKppb+oyoq
         NIs1aFi1DM+DgzFBDagwhy8act9bVLcevAWrM6zNc3/fT2tNTNLUgWybpDMtZrAcNJns
         UROWO/UDBi6Mmg5DSUspUOz9Gd9dRtI3ZdJ0cltG6rJ0mRRcujbhn7gfBAwP95O+ABsM
         f1uw==
X-Gm-Message-State: AOJu0Yx+gbe493GWbrRN6e9IUVNWYe5/b5uz+83DlIUI3DofHHr5mFxO
	aBCZZpOOFk9LWla/QEgkwVQ=
X-Google-Smtp-Source: AGHT+IEsss1sE5P6PCOo9cOkcdRQIbNvEKYz6FnbYDkiPnC/oiwhxvXRu0x7aqyfdT5zy4jYNXXhEw==
X-Received: by 2002:a05:6402:797:b0:544:3944:d7cd with SMTP id d23-20020a056402079700b005443944d7cdmr1236784edy.2.1700297510204;
        Sat, 18 Nov 2023 00:51:50 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57ba2f20.dip0.t-ipconnect.de. [87.186.47.32])
        by smtp.gmail.com with ESMTPSA id o9-20020a509b09000000b0053deb97e8e6sm1584438edi.28.2023.11.18.00.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:51:49 -0800 (PST)
Date: Sat, 18 Nov 2023 09:51:48 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] staging: rtl8192e: Remove equation to check limits of
 channel
Message-ID: <1f91cf8145b304b09b37734a2a504da394833378.1700296319.git.philipp.g.hortmann@gmail.com>
References: <cover.1700296319.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700296319.git.philipp.g.hortmann@gmail.com>

channel_plan is constant COUNTRY_CODE_WORLD_WIDE_13. Remove equation to
check limits of channel as those are always in limit.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index d0b7332645be..bb7b5c793b26 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -51,7 +51,7 @@ EXPORT_SYMBOL(dot11d_init);
 
 void dot11d_channel_map(u8 channel_plan, struct rtllib_device *ieee)
 {
-	int i, max_chan = 14, min_chan = 1;
+	int i;
 
 	ieee->global_domain = false;
 
@@ -59,9 +59,6 @@ void dot11d_channel_map(u8 channel_plan, struct rtllib_device *ieee)
 		memset(GET_DOT11D_INFO(ieee)->channel_map, 0,
 		       sizeof(GET_DOT11D_INFO(ieee)->channel_map));
 		for (i = 0; i < channel_array[channel_plan].len; i++) {
-			if (channel_array[channel_plan].channel[i] < min_chan ||
-			    channel_array[channel_plan].channel[i] > max_chan)
-				break;
 			GET_DOT11D_INFO(ieee)->channel_map[channel_array
 					[channel_plan].channel[i]] = 1;
 		}
-- 
2.42.0

