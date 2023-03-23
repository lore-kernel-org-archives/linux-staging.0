Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209EE8F6D;
	Thu, 23 Mar 2023 12:54:28 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id i5so39202268eda.0;
        Thu, 23 Mar 2023 05:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679576066;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pX52XM0zRvUzVxvJJ0vn8RkPlcGXAVjIMg1ZZMuVw6A=;
        b=JNckdacg1naHJJkl0VIq14SjtKjI4d63MZ+jHy+9Ys+WdpkJUXqTaqoNNydpBpFhEI
         Xlod7+U6dj7DELQWKUnQ2N+WkwmkRpqDybX9hJBYNVi0DwHRjARahW0xHBf8OU2x5Tig
         SlD4sRcQIIhDGhuRVGY+9cH88H9ZL6j5OdozW6P2eC7YoMo4L7ldxQBneWTrHC42XONL
         S6hnmIg9+yLDICpPDZfKzISHlpHktiPeV1f/+P21cCgtQgFjXuiKhR8235ZeKVMYFA4H
         wZcUOgqMwT5ASlVIO0gx7p2V27Fv6bLDYPfsux+iVDqBiW4wGpODd05s+eE7W+mrotGE
         gydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679576066;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pX52XM0zRvUzVxvJJ0vn8RkPlcGXAVjIMg1ZZMuVw6A=;
        b=KMgE081VgkjqhYaBmWqgyqtlVZLLxQGViiSuGU1jLvDzgjhoKCj/iRZ9H1vFMRmytR
         4LU6leP1VAZ2bnUFTWwV+flHMJOyy6vcbZPM0evU5+gCBXBQWn/B0+0ROVfCQmu/KqJk
         9boCGKl5/58RQTAdHuLGIAbSdFrZXx63PdfBrNpE9/fldFSrXYNKbwqPhpsKk+gZT4D4
         sALq41RMwuKmcjJ0KgTyW43BSH4dq8+klXygw3ZSh3AUmC6eEhElLu3te2nMsgOGnro3
         /p85W6/Gmq+J5NQ+LgufTfiW+KZq5cY3rChjTiqoW2MEq98El3TnGVNTqeUNBySr3G8U
         rGYw==
X-Gm-Message-State: AO0yUKVHO5ibpK3HQpNlftf9+9TB9Ezv1eSnmxXCReTchY7FMggHKnZN
	br4+c9K55X4kaVYNVrhzTvQ=
X-Google-Smtp-Source: AK7set9LMVxJwJZSdfFoOY40GVCE/+x+i218n9wj38CKV1SocCzpXyDCtOnuUKGr2eFBVVftW6Cytw==
X-Received: by 2002:a17:906:a855:b0:931:8e8c:2db5 with SMTP id dx21-20020a170906a85500b009318e8c2db5mr10764233ejb.69.1679576066318;
        Thu, 23 Mar 2023 05:54:26 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id z3-20020a170906434300b008d427df3245sm8664896ejm.58.2023.03.23.05.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:54:25 -0700 (PDT)
Date: Thu, 23 Mar 2023 17:54:23 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] staging: most: fix line ending with '(' in video
Message-ID: <ZBxL/yqLU1dEQlta@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Splitting function header to multiple lines because of 80 characters per
line limit, results in ending the function call line with '('.
This leads to CHECK reported by checkpatch.pl

Move the function parameters right after the '(' in the function call
line.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/most/video/video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index ffa97ef21ea5..6254a5df2502 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -365,8 +365,7 @@ static const struct video_device comp_videodev_template = {
 
 /**************************************************************************/
 
-static struct most_video_dev *get_comp_dev(
-	struct most_interface *iface, int channel_idx)
+static struct most_video_dev *get_comp_dev(struct most_interface *iface, int channel_idx)
 {
 	struct most_video_dev *mdev;
 	unsigned long flags;
-- 
2.34.1

