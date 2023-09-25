Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E47F134DF
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 12:13:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4053c6f0d55so58164605e9.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695644007; x=1696248807; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+LR0SHMW4p0H4FjGzgjY9zgTtsyGifRyUl05vlzGrI=;
        b=epH283GbIPj5oYf8zf9htFMZ5wa8dJtgh294pJgxI3hsaEhh3XxQkEaY8Ynr43tgdJ
         BziF2Z9mHiVplcGgFg5EPp3d7TV3lzn7sULVdw/lLvB5kNNz6XimlqP5aKEs9iBTNyqZ
         5LPwggAPaj5EPpyYPvCv1Hs5ILrDF5XhTctVWRtkbD4fG7vU8bwrVZfQa3QtpgCoD2/u
         gAX5+sOUaFPUQqAYEDqtTDtvQOIoNU6gzTyQhWSY5spjx5CRTZhQzaW2Ru7uGO+ymVzX
         t6q+EQj4/TEpHbRIXvFlfSRLcdcQ7gecr27P/pn5ks/VVVisXUuKvPm3JV1nCiGQrKJR
         I63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695644007; x=1696248807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+LR0SHMW4p0H4FjGzgjY9zgTtsyGifRyUl05vlzGrI=;
        b=eUko6tY9mO8jojCNoHt0HKrwZ1yudl9OLuDWs1bA6/fL5O4g9hMgfLAIXpiQmLYM1V
         yFdERjU0SGdjBlOMe15MUa0uBSp99JCPDgesDfnupzhOLPf+cjaCuP1v7i/YDKk3wH5/
         qytbTc00cN2U76az7ScBs6KNCX+msIQ4JkHCvhNtP2XLW4PWRhRC2WfvgBuvFTM2wQ3Q
         HL+q/WzmV8sPkcb/wZDqadLbRubH1U9cFQYUs2/ln59rCkJyVuo0kkTRbIrcQSFd/URE
         tPHhK3MNg4GveyPSmDu3oxeyjVOqX5lWqwmYNn59ZuLUl/oH6klSQOI8og/H+hGGPLGX
         oysw==
X-Gm-Message-State: AOJu0YzpMlNeriGqfhfTbFCix3GB/RIFlSN75GJKWDD5Kp3gmgl8wPaL
	n3n7V4ltgQycWB829nukmrVkiw==
X-Google-Smtp-Source: AGHT+IG0DtPkitzxHkKrZpcA2UeQwWq9WhGVpyMMh604v1w1NWcpMWjO/+wjgnfUhw0MBqK0altx/Q==
X-Received: by 2002:a05:600c:20d4:b0:405:3e92:76e3 with SMTP id y20-20020a05600c20d400b004053e9276e3mr5897993wmm.22.1695644007105;
        Mon, 25 Sep 2023 05:13:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k19-20020a05600c479300b00405391f485fsm10793994wmo.41.2023.09.25.05.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 05:13:26 -0700 (PDT)
Date: Mon, 25 Sep 2023 15:13:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [RFC PATCH v2 0/4] staging: vc04: Drop custom logging
Message-ID: <fe6de4d3-3ca2-4519-b37b-afa55f961728@kadam.mountain>
References: <20230913185528.770634-1-umang.jain@ideasonboard.com>
 <1d54715d-25f9-4937-bdff-de0136c95fe8@kadam.mountain>
 <d8395455-44eb-6762-d978-e912bf2cfe73@i2se.com>
 <3f040e44-3bdc-b09c-58b3-ea3b0ac6d5dd@ideasonboard.com>
 <21893e62-2a93-af84-a004-5bebc9916627@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21893e62-2a93-af84-a004-5bebc9916627@i2se.com>

Just so it's clear, Stefan and I are on the same page on this.  State
dumps to debugfs are fine.

regards,
dan carpenter

