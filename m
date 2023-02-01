Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CB92F32
	for <linux-staging@lists.linux.dev>; Wed,  1 Feb 2023 13:22:49 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id y1so17316185wru.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Feb 2023 05:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQsTT7vzEv2btlkh6hAE9R2TMqftLVwRfIlZmCyBNZ4=;
        b=ObeEnKk3ZN9uzXVtLvh0MFNQR/+WxPcY4FvzCab4X0MGlPdZSUy3gmObjKOve07PE7
         YPJtuFqgvXnaEnnQizzr8+FdlJsb3Pftjy6r6xbalhpTRev+5eRW7gUS8D0MBRhYswGG
         qj/1WpLyBJM1GD43luSHyr1wPMU1kWM/kztHhr0B+dUpjIqRlaki3dBYZM3zdfwRez5h
         0rflqUrAgUbJwGiDYHgEsGKl+/Otdwxo+G2XWLEDpGjkCDXpdDbvvpvfbTRa29mP5lV5
         jftA5JfCWHiR4Yk86Iq59W77u6BTRG3yeh684RzhVP5i6Q71WgJ4n/ZWDoHoDsGC+cbk
         DYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQsTT7vzEv2btlkh6hAE9R2TMqftLVwRfIlZmCyBNZ4=;
        b=XyrNVNA8tuylT7pW0NV/uDUnOlCoLm47q2t7sN8Y+qC+BJj/ZsKRBmW8ZBdy8sF0VW
         v7KfJDiqsp6BXLV3jxy9apiVPT0DTQzNlDzNrCxifsEvJHLLh57lPIuBnuwEmyojd0bT
         /AYnQCZ/boNJ1IVhZxZpaRg7jOpDmdPyi3eEBcTBpmxSlN85+8w1uFrVHj6YpcLqWuIa
         GLajxOVoaVNLnNhWuPSsS6UD1VplGSRFcq0IW5Sfmiw4AIGHzlc96yr3RMHXjr9/4LF4
         J++le+RsPGwhzgHUnLyI1b8V76tjV2TbpCtM0H+omc4nkQ84DpKZSsPBuEmT6KP4/M00
         /Q1A==
X-Gm-Message-State: AO0yUKX71WqtDr08aIXRLVzLOLKELEeJGPd5A46JZNIcUwfYxuGGXkFy
	DDHUr+3Ok2fwyQyRBeE8bJk=
X-Google-Smtp-Source: AK7set8617xhhvfVL6x561L03xUlErWEyI0KsbQ4bh1o9aPwd8pdzJJQUkKMSnlzhu9d3E4JWEeJwQ==
X-Received: by 2002:a5d:4103:0:b0:2c3:733e:cec3 with SMTP id l3-20020a5d4103000000b002c3733ecec3mr2292900wrp.15.1675257768176;
        Wed, 01 Feb 2023 05:22:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m17-20020a7bce11000000b003dc492e4430sm1789256wmc.28.2023.02.01.05.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 05:22:47 -0800 (PST)
Date: Wed, 1 Feb 2023 16:22:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Laight <David.Laight@aculab.com>
Cc: 'Guru Mehar Rachaputi' <gurumeharrachaputi@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Message-ID: <Y9pno7gZHa+r/Rg3@kadam>
References: <Y9h42l/8EcPqn63x@combine-ThinkPad-S1-Yoga>
 <Y9ilj812USHrSXe+@kroah.com>
 <Y9jrOKMGl7ITKxhP@combine-ThinkPad-S1-Yoga>
 <19e492521b4a4d31aa13c45e8616689b@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e492521b4a4d31aa13c45e8616689b@AcuMS.aculab.com>

On Wed, Feb 01, 2023 at 12:34:50PM +0000, David Laight wrote:
> In reality having a uapi structure with embedded padding should
> be banned.
> But that would need a compiler attribute to enforce it.

It would be simple enough to grep the names of all the UAPI struct and
use pahole to make a list of the existing structs which have holes.
Then re-run the script every week and complain when new holey struct
types are added.

You could do a similar thing with Smatch looking at copy_to/from_user()
struct types.

regards,
dan carpenter
