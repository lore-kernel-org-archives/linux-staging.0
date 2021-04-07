Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544BB6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:43:34 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id mj7-20020a17090b3687b029014d162a65b6so737401pjb.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bvyOIchcblyTZxnk7QAJ5m+10+TOrC3FpEbk+84z4mA=;
        b=L2LHFPXPOiW6v3ukim6PWI9ekG/YDRwkjW5YT01lM9eZ9nS/i+qJnVnT8ZVAyRalD5
         dKnt45ZAZR5MioQkIpRouxs1KonXRR1Z+hfsguv3UJONa5oBBBqL+gVj0jZw4w/8DyNJ
         25IBbZqpKGYMHJc4OZTv8QwTsli8d1gFdQ9oItH5/ejvzsH8B1kWbzecw/VCVD15flQS
         0ltX1D46/DWkQFSv9HiC2ZU0gTss1F/Sik51jCaN4gwoqAC01DYFwSLCbLewi12/gQU5
         8T7dSIFDckdzWIshwiNcZrQ6gPymfFiEHfnI7k2PeQuvNGF2trbL0tfKnE4Pb9e1atoV
         oWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bvyOIchcblyTZxnk7QAJ5m+10+TOrC3FpEbk+84z4mA=;
        b=dPfSNy2hd9QbCWiTYnsxRcXGIPqaqICm9+Ub0Tu8KBd9ce0nhELCV6hIan45puZoGy
         /2ubK8SN08oYyHUpKvMfL+mYYdivX1ORPVgNhB3DccLKhYxoI8q8xMp9FrJ4JGMhnk/D
         Y6h4yWtBv3At4ZHU77C2IvTZhpUg3FHAfF8RY4jmshL0C/ONDKBhOnVN4z3JTzeo6law
         IWQedxDpDotdGJvaNyqb2tXoXqr2ct0Qcm0FVQZCi3HBIm7zr43wi1WlXujArTa+1bNS
         PsNpZ06EKHWMjxntoXQdh2KnEdMz4IofxQjxYSF6T4aG3eFJeQ1qkTcbJJgx0ad9iRIM
         DkAg==
X-Gm-Message-State: AOAM533xi+ocM/+Dqyj1BaxOx0GQYcmlnaSp1BQbVqiDr8Sov9wV6M+A
	2ET4OY30QAPgP+nX2J3xjwI=
X-Google-Smtp-Source: ABdhPJy4Ln4m3cV2fjHszjqG0UJvfKjad9FvZloqq8wON2TZdz9ZWHsKfeBcQ/qPq0j5Rz86wUFH1w==
X-Received: by 2002:a17:902:ee93:b029:e9:6b29:3219 with SMTP id a19-20020a170902ee93b02900e96b293219mr695699pld.16.1617777813875;
        Tue, 06 Apr 2021 23:43:33 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id e190sm20147991pfe.3.2021.04.06.23.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:43:33 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:43:31 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/49] staging: sm750fb: Rename function parameter of
 sii164_enable_hot_plug_detection
Message-ID: <d2feddde2b2d8658ea990eabf16747561c15c395.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl check for the function parameter
enable_hot_plug in the prototype of the function
sii164_enable_hot_plug_detection.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index ceafac60340f..ac1431dcb419 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -34,7 +34,7 @@ unsigned short sii164_get_device_id(void);
 void sii164_reset_chip(void);
 char *sii164_get_chip_string(void);
 void sii164_set_power(unsigned char powerUp);
-void sii164_enable_hot_plug_detection(unsigned char enableHotPlug);
+void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
 unsigned char sii164_is_connected(void);
 unsigned char sii164_check_interrupt(void);
 void sii164_clear_interrupt(void);
-- 
2.30.2

