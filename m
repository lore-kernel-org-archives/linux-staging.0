Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625EA14F8F;
	Wed, 18 Oct 2023 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etRn1hJn"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-307d58b3efbso5176944f8f.0;
        Wed, 18 Oct 2023 01:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697619183; x=1698223983; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=geUEpwvi3+e4pwlZJkv1VdkNb71jcT4N9IHDjoo0hiw=;
        b=etRn1hJngernmMN6VosyG8vCZpRD4sA6BoxHNFoJd1AtK9QZbTuurL6U71g8tpoKtP
         DP8Hbo65zuZq9NwxYSTlv5qcMgEPCS5UH78v6n73AjFMWyjoDomqnoX67JsawHZCJ1zy
         RuhJ9pfJ1tLKHzfzAM8GJ1CL2oEP487rx6/1pFzndiuBUMghGUj/nFHeFN3//Qm96c8A
         k+cLTlAtFFdFkt/upTbOvQdqwuXK+w6qOwwVFjRTDqyVeYDxx1vbSaJtWk3OumrvWpbW
         F4MFw7e8EkDCXXfkUmcLa5928p7b1bJHNnP2hqkIlYMUYs7zbOHfcn6tRRxz15hA/+Bv
         yD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697619183; x=1698223983;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=geUEpwvi3+e4pwlZJkv1VdkNb71jcT4N9IHDjoo0hiw=;
        b=dVKqSVYLyMMDwzZoRa4xx5U70hRPXC09NEfEoHjLPwxKnAbg4I0zJJ2a5p/CO0oxDO
         LarU3DNjrgHIGieit1VKyAitYScSqXwYsIMzniubeIif/4L1jm0K8VfcbFZg3kf0zJZ9
         WiVX6KGpDcyGCxN4fA1h1dHcBnXOgxy3wQy/4qhO2qeDd4iM4NtjsKXGjeCv6B7FkfNX
         Ty26pWfc5IkGESTd/LGgxbKAYqVQcPF6SPl5plwVVNyKQwv/VeCd2QYaiL/4DVX0zmrD
         +3GzFskuJY7GC8EOlC8D/Rvi/8PTPmxHYI9h4SZ4sId0ndCiNLlu4hzLQojD7tLhs2WW
         9oeg==
X-Gm-Message-State: AOJu0YxIFUKDNtYuqPpa+Loa/nXNo7HaEX/Ub0WD/bKu+Gz76y39VFJ5
	dfY/P7h5wGZGW3HwDSMFcMM=
X-Google-Smtp-Source: AGHT+IFe7N0r16SpcIn2ppSF9YwaBfMXR5p9HHAUkW/Z5SFuEG/gq5GT5k5JsnJNXPESx8hwfICsIA==
X-Received: by 2002:a5d:540d:0:b0:32d:9d99:d0a5 with SMTP id g13-20020a5d540d000000b0032d9d99d0a5mr3493755wrv.5.1697619183280;
        Wed, 18 Oct 2023 01:53:03 -0700 (PDT)
Received: from lab-ubuntu ([41.90.71.30])
        by smtp.gmail.com with ESMTPSA id r12-20020adfce8c000000b0032d9caeab0fsm1612082wrn.77.2023.10.18.01.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 01:53:02 -0700 (PDT)
Date: Wed, 18 Oct 2023 11:53:00 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Calvince Otieno <calvncce@gmail.com>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH V2] staging: vme_user: replace strcpy with strscpy
Message-ID: <ZS+c7NtfEw5ne2Oj@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch suggests using strscpy() instead of strcpy().

The advantages of strscpy() are that it always adds a NUL terminator
and prevents read overflows if the source string is not properly
terminated. One potential disadvantage is that it doesn't zero pad the
string like strcpy() does.

In this specific context, both strscpy and strcpy performs the same
operation without any functional difference.

The reason for this equivalence is that the driver_name string "vme_fake"
is shorter than the size of the fake_bridge->name array which is defined
as 16 characters (struct vme_bridge {char name[VMENAMSIZ];...}). Thus,
there is no risk of buffer overflow in either case. VMENAMSIZ variable
holds a constant value of 16 (#define VMENAMSIZ 16)

The null-terminated "vme_fake" string
(static const char driver_name[] = "vme_fake";) can be safely copied into
fake_bridge->name using either strscpy or strcpy.

While using strscpy() does not address any bugs, it is considered a better
practice and aligns with checkpatch recommendations.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
Changes in V2:
 - Make the commit message more clearer.
 - Remove the incident extra line change.

 drivers/staging/vme_user/vme_fake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 0e02c194298d..8ab5b43c70a6 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1091,7 +1091,7 @@ static int __init fake_init(void)
 	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
 		     (unsigned long)fake_bridge);
 
-	strcpy(fake_bridge->name, driver_name);
+	strscpy(fake_bridge->name, driver_name, sizeof(fake_bridge->name))
 
 	/* Add master windows to list */
 	INIT_LIST_HEAD(&fake_bridge->master_resources);
-- 
2.34.1

