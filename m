Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58780DA96;
	Fri, 10 Mar 2023 19:15:59 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id az36so4136079wmb.1;
        Fri, 10 Mar 2023 11:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678475757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AqbNsTNOU67IwaiaWCAxfvEEEDh++1uXymdMW0foEhs=;
        b=cT0jJhdjcwmJq6UzC819mX2/Azk1UEB9t9n/W+tWJ6SWmbiKqZGGOWzwKRB9BFqRUu
         vJWovyAg9K6qJc2QTNYn3Oem00xTTae8WAWyHdq1NqQt7jiy54Ng/qiLFS8Dq8kUt2pG
         u6KGguRcep7kPEP9m7LOK2Gct3L63SrsJqbFXNJZYQr3YoFDaPyrZInal37N/dXH+zOR
         YorOH89iDSSJdvJZNEF2DCiybdhVPBKz1bFABBpyvemOi2hwgFYudsYqp1Atp9+egtwG
         +t+03XDV2W8kO7qWrrbQDIvvmZ5oOlEolrO/DbSLGPTc2ZFSkRX2HIWuG/8RhtbTq/LC
         SQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678475757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqbNsTNOU67IwaiaWCAxfvEEEDh++1uXymdMW0foEhs=;
        b=YExVv5De2sTL6zOCqzWCqHloevKQoxj4XNC5lbhEu9ARE2Eo3u5xQZK4EAilQO/D4R
         JQn9yS273PODNn7xJi9BJ1sWSMrCd3rlJyvSPbMMgZCrSfl3LtLJlWBO+WSw/4q1yriH
         9A/S1s8lzXUMk+87wtceDaW+W2Ue2rnXPM+ZvAol0eqzHyZrjihXM6j8t96iq6V9CNSH
         JLVyUyj/ySbJknfYE8kejzFhXsIMk+bLNJy+CRYFayekMy1dKlj5poFVXSZuSEcX8dRO
         +9Z91MIAAza87c94nCm1fgu74LolxGJg9I4wrwUqIwI7lKTdDrZUeEzZ7yxiEijSTCTJ
         f1IA==
X-Gm-Message-State: AO0yUKVxXtgA+NZJ9m5cV9vU9I4VNtSz07whUUeDK0DkgC2JJwWeDAVn
	o3FR/flcvfa33t68ti7NNkw=
X-Google-Smtp-Source: AK7set+ubJCHM2ZlWoVvoojB2vEcbbw7e5ifnSEHfK8SB1s3rdsPs3+lH0WoZPup6grrhJM5pia7bw==
X-Received: by 2002:a05:600c:3b11:b0:3eb:f73a:cf89 with SMTP id m17-20020a05600c3b1100b003ebf73acf89mr3677472wms.8.1678475757388;
        Fri, 10 Mar 2023 11:15:57 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id y4-20020a05600c364400b003eb20d4d4a8sm655548wmq.44.2023.03.10.11.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:15:56 -0800 (PST)
Date: Sat, 11 Mar 2023 00:15:54 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix exceeds line length
Message-ID: <ZAuB6hJ3pOWxnWuS@khadija-virtual-machine>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
 <ZAt4irZnVJW4zQNb@ubun2204.myguest.virtualbox.org>
 <ZAt9e8Xnd4wAnjPn@khadija-virtual-machine>
 <ZAt+wJIhq780Ms4T@ubun2204.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAt+wJIhq780Ms4T@ubun2204.myguest.virtualbox.org>

Hi Deepak!
If I join the if condition to one line, the line length becomes 97
columns. Would that be okay?
