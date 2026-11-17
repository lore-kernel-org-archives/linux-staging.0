Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935213;
	b=fyK7vTDretSx5uIu6mUW1ZU6JB0UhEe28Tg05qDE0JCkxwS84BysPcSzj+vq03vigDOx
	 w1nYJs2pXehkt/quDSgmbd5L7Cm3XhFwhDs3lBmFgdVm8eREUbOGy6s04lLF1L+ya4QKD
	 HHZpCtFQVZxHw8yoDXYmPIrovayubZ+gUoUI6LhGJ7NBAFRQGaZcqOe2Aquj835uLiCJ1
	 ZLej3MsT0yFLDq1rcyIeTCnfNkFeb6CPAXzy6jQSmKjUn5E7RYk1coj2TbTAcwcM+S4z5
	 QNNf9FpGP8IM2jQv6jzIasT4OoFNPByaP3OhTTGYYEexHiUxmhOqDo+lQEF/GNMDjrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6uErhzU3bHynlM3I7dAH3Yr/9fx8LzPRyuOlHjQzOjY=;
	b=gHDY4AaaGJEcfm6p7RAMnMz6PPvsyL7xT4Jp9+uHSL1QaheUefprIk44vxCR1KwUTUxI
	 PQWjQzRa9/QFn8b+N7b3QmPJ7UiMOq23WKRSCM9dQmppQPDZmIy0Wwfx62rIFfRBTk+w+
	 WeDZQZHvJq/tOwyVwK+7ZqaiHUKYChl1onvFvj/L5xVI0UotfqA6QIHKSkiwNOSa3W5jC
	 b5WXowHJvKORGhxD+epuIeVG2HVtVM1fh3NnURoWWuJca2AjblwyGVxJbxqOOzhRf4B3w
	 ZeuWgX+FN5tz1+0CYHcuAfG1UKut4oSMVtWq5QJKgSuTnb1KKJZnKTwv24vNsGXJLKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFVB6Hn2;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9CB606A31C
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 17:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE9CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFVB6Hn2
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3acec6677so32016c88.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 09:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935212; x=1795540012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uErhzU3bHynlM3I7dAH3Yr/9fx8LzPRyuOlHjQzOjY=;
        b=jFVB6Hn2QWtXfQFrjLevbNaovoV8/e/HBcXy6LK+d1IfyDyVC1RM+hCHYrBUj+wc7u
         bRge/u+bxLJLJ48TYIkNCERxgvqRRa8mvNENewqI3ghSEM6o6olH/aixuVUev6tCfhQw
         83Ufu/qHhyoPwLQIJua0cAUyNnE74jFOHk3Vr4NfGIYaV/FEC9WCnZCQp5z/xZxeWWBN
         STxlvYMV83/4gHWg4nIDmY5Kqpr21lzHlwjn5NwceeogcOAsd7XdC6S95S3YyDNsqk3s
         n+VOdpD4p8Q00LwZKrbG7mVP4bgwQ8gGW1QflJ39LL2qrayyZN9WA2NMCloLcZ8uDxvH
         3UjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935212; x=1795540012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uErhzU3bHynlM3I7dAH3Yr/9fx8LzPRyuOlHjQzOjY=;
        b=nLgBac3YnAclj0/a0UMEgwd5CrlMy0lQdxqU5u7+7XtjwFbe0mw5BrYjvGVENZcGS4
         YFNYJBFbzs04dM40qYlhMYfEYX1K0EZmC7PAyUV9BR/hqIDgCfoVMqJA+zU+z6b+NLpQ
         apYTfAOux9UYDLuWiW94ixPsJ7uCafPeYsZ2gs7N0YxVPUkoKiPZ5imIT0emu+sye1GT
         1EB2XE6V0qMaLcfA6RsGknD5VjUZrYYwUKayCGvwLx11FbX585gsk+k4Mc7xoH1OhXMC
         su6ePcFL+gyfTqB25hEhEuA7IUmnaFKpqgwTV2VnGR4klzQcX8IylzIc1zFnfsCdHV4N
         5KqQ==
X-Gm-Message-State: APuU4Z9p+rQCHR4zJWvoAOUWm05ZGtTsUfgqzTM37SNYitD9X2U2bHoH
	2hgTHk0BO7AOeu0z7bJmZw/sieFj048jnDkmWS5L4gsrGBjT6u7pKCsX
X-Gm-Gg: AYBFou2+LipOkUDBcZRL6o6sJaQvI2bJnYYGkTERWg/s8/TVoHi9Ql4DVBJS86tI3TS
	tRqyiG8REa2GhkzveYZH9g0bxmnAobyUm3LKaYg5qHSEYMBRdjNux/N6bCXloB99tXjecjHqg+z
	2MLFzc2ZMLpgT+bBQRVu27r0YxbffW+CyFmu25IiEsSyphsfhZtFdVi6Xwj8FIq7lI+BdYThYgs
	Yzr38Js6OawgVV+ndNP3x29FBwOY7zUx1lSEjDWAqSaWwkHzC6XPgMbzFKGSXw6fuSYRnvbuT8t
	NmIsmVKcxSzCy5aidCL6Ebgc8iwhPfpSvzJLmDwlAE9Tp9NlNeDHmeaagIxCWJjGacihFdWHYx7
	l9cfPtek32tpPXp35EabvIbet/DWL+F1fRuiFmGv26j5xiKWOVAuTwBHxtdKfWK77pgDKEAyvBB
	v4JlznvEUwsfDCzdyOTooMz1mboNywmCNTeMVIVtO5WNgkuTv3OtjMHWZd72btPPb+SCAFexMSW
	S1UeZXCX/9Fp7T+tjsj5Sy6tYB7Ecvovv/NMV9ZESlIxlnvtGDwRAVUcbFC7P/dDRGjJNfZfwtR
	jxiuGFFGVjEjuy0IigEH9vx6Ptg1PTipGQGTb8zo3OWvNVffpJ3SaIFOiu2qEaAHhMTJbzE9252
	+sukT9Qs8I9P/+CXlqsmU4jNqTeiuE3R3RXpNdYr63j1DTVEWEYwgm6jZRDNrt0M/FQ8=
X-Received: by 2002:a05:7022:7f04:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b543d3bb52mr146484c88.29.1794935211973;
        Tue, 17 Nov 2026 09:06:51 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm42046436c88.12.2026.11.17.09.06.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 09:06:51 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH v3 2/2] staging: most: video: Document locks in struct most_video_dev
Date: Tue, 17 Nov 2026 22:35:58 +0530
Message-ID: <20261117170558.33844-2-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261117170558.33844-1-patelshivani2283@gmail.com>
References: <20261117170558.33844-1-patelshivani2283@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl reports that list_lock and lock in struct most_video_dev
are defined without a comment.

list_lock protects pending_mbos and mute across all callers. lock is
assigned to vdev->lock and is used by the V4L2 core to serialize ioctls.

Add short comments describing what each lock protects.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
v3:
 - Reword list_lock comment to "Protects @pending_mbos and @mute" instead of
   singling out the rx completion path (Dan Carpenter)
 - Split out locking fixes into patch 1/2

v2:
 - Add a commit message and Signed-off-by (Andy Shevchenko)
 - Use the "staging: most: video:" subject prefix
 - Make the comments shorter and accurate
 - Drop the outreachy list (Julia Lawall)

 drivers/staging/most/video/video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 92d5fbc9a..02a44659a 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,7 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/* Protects @pending_mbos and @mute */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +41,7 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/* Serializes V4L2 ioctls, used as the video_device lock */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.50.1 (Apple Git-155)

