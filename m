Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AFE7C
	for <linux-staging@lists.linux.dev>; Sat,  4 Feb 2023 04:25:42 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id be12so6911027edb.4
        for <linux-staging@lists.linux.dev>; Fri, 03 Feb 2023 20:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9G3QUt2CZ40pzuAm4fiIJj6Z+bCnrgF77LZgEjYe48w=;
        b=iRJm/OF4OIg6buiz5H5huDa0PGax7cBMIrBgyyrVyS0MvGyxkyiVK47Qkt97U9g20H
         /MdmuUkqGBcLeXcRliOm8Ov8U+EpOTpZs1wgK9OmFbHmRu1A7qEhVDgt2/PZTTY4kPA3
         I5CwkT/iuSg7UgHfyvWWywtCDS2xtj8sZmeLZfEN6SvrFos6XjiL2ZzFx60bMCGC3NWb
         NO1tMonKD14OyNBxfGWu5aNpuiFs9GAq1fy6WW822sLVb1AZnhpMbEqyFNrqqmgJOI7N
         NFthUt2/R3paC8ZXp+9Un9fQ/s2k/ls5g7dPaDr1m67QfyUI3eVH0JfNQhrenrbnv1AL
         beDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9G3QUt2CZ40pzuAm4fiIJj6Z+bCnrgF77LZgEjYe48w=;
        b=lWypHY5IVoypnA9Pkinszvtj56p4mw2QZ9YvNDEXweqA/XAeIS4JUPV6p+O18s3RbY
         kb0Np3LO36Nyom/ZleGKzrETmlMagLmLK6jxQFXynR+6FavUqq4d/6GHatGCvN46nrx7
         bI1s2ztDVhOkj8wToyOk30en78yoq+8TJ7U+GOTe5TJBSkW8EVIoN0NG8eyQr+MOUSG5
         6LfUsNKZtwdNG1OeIe5d/6kux1ljAAt/YeWBUM/GCfowuuNme7Yg5LYgD0b0041JBwms
         vuS2ij7jsdpcnz0/NPa2eEhxQl+lXknQJQJ9cFCY1giyAdfLY1JBYVdbiumZxfl0pbnL
         84ow==
X-Gm-Message-State: AO0yUKWfVyjAtKI05j6JezHmsthNEinrQUqO9BY+fCQtPlmNvuRpDBx3
	LLU830W+5gfRr147QHw+ukY=
X-Google-Smtp-Source: AK7set/a2WPcdqUXNuXetopO/q6Z6vb1L07WV1jGDrOPEMYKN4voTJpuum1pmaeQbYgHwv6nhQHN8g==
X-Received: by 2002:a05:6402:520e:b0:4a0:8ea1:cce with SMTP id s14-20020a056402520e00b004a08ea10ccemr15984249edd.25.1675484740600;
        Fri, 03 Feb 2023 20:25:40 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id v4-20020a056402348400b0049ef04ad502sm1957923edc.40.2023.02.03.20.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 20:25:40 -0800 (PST)
Date: Sat, 4 Feb 2023 05:25:38 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Regarding checkpatch camelcase issues
Message-ID: <Y93eQqaYdL146Z65@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for your support.

I wanted to confirm if each checkpatch encounter for camelcase issue should
be fixed in a new patch?

For example: If the issue is with same variable, then multiple
modifications can be made in one patch.

  -> above example is OK


For example: If the issue is with multiple variables, then multiple
modifications can be made in one patch.

  -> above example is NOT OK / NG


Please confirm me if my understanding is correct?

-- 
Thanks & Regards,
Guru
