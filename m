Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03683C8708
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051462; cv=none; b=Ye8UEP3aZM+B2Fec2gVQKn02hP+N4b+idOhzDCqxWHocVnjmjd90p9Tcv5Wk6Z/4MZOXSGzQkCLrFIqjxtGIHW9wSG9uT10N1z5cASB+QzauaqwJXYkwPTYXcHH1eVW02OXRI4iTSHL1pYXsVmJxv2iOTydcyTBsys0V28Mb7sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051462; c=relaxed/simple;
	bh=CIupNoGRAJhDCs+M4LryVa/UMfY0kmPZCcS9BO3lfIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ku596vPvmU2Muyz0Df2t5AWIIqf6JUKozEDs06mNK3eKqa1rRunFdfFnIP7AlsZEHbiWxOfInDZJAqVRwtuJcqOOaG/WGZkj9AcxP5w54D7D10KE+klm0cbdUGneSfzYoaNXa3ctjxazVYj7Gzdj9gwi5NTaUCmXgmZ7j78XJ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsXpH+97; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsXpH+97"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49050bfe053so43808565e9.3
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051459; x=1780656259; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CIupNoGRAJhDCs+M4LryVa/UMfY0kmPZCcS9BO3lfIA=;
        b=NsXpH+97DL6ybrGk1AQb+HCR4r92G+oTMCs89ci6szej+3R43gymTggKQQ/JN2asuB
         ixVTqlvQ+9FWRiZQ3613JAhL3xl9RdbbEzS1WE76pvvBlcSv3AyPWzCW4kVKhvVGm35A
         KixuyfzBTYP20V6MUzjnBuNHa8MnBCYmilUDwfnsEinv3PDQ3ZKhVIt3jBlF12snNiV+
         Z7kNAdb+XDpY64JV4cUzZE4vBmKUGRQBtEbFsahex4AlbzhLtl/eNZgXW6ripvR7SyAH
         6mqd6ACEh8PMDJawzitUef6MQJNi/+/8jRVgubsT4qpySkre8N/gQ9Hpl66CtDqrvOXJ
         lDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051459; x=1780656259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIupNoGRAJhDCs+M4LryVa/UMfY0kmPZCcS9BO3lfIA=;
        b=YdXEoaT5WaMEodfW4tZMFgzYicAvtup+OIIoUhS1CFfzFCG6amGGidu3JppnO/UYwv
         Iy2Pb9LYEE+9LKDIuiZ+oN42DgiACjTgLtsAyFvb/zc1hJIicuwCUPKoMrGbBEq55gkM
         3pk5e24dENKNjxUo2H2KbuuA/mjCrjLjED1SulvlV6/eDmnQiJTnB4HUlJ1Yq4giiEkM
         DoHdyzx/f6YPutPjXDP54TvcOqU+xIgWxDTWFlBaX6a92gqHYmKLjU71vqK83kPAW+lp
         9HQKKdh80uS6JNOtrBF0tFUEIDhCrYAZcg4QYPlVSU4X6aRwGxofUKDDVdQU/aWBbSu2
         lFrA==
X-Forwarded-Encrypted: i=1; AFNElJ+9oEsYKpeSBfHPY4qy9wdE41Iv9KI+hM46oy1pw8vpHO2oNDpajsKCsuilY6USaGtTTh7URZ8cTx+kaTo5@lists.linux.dev
X-Gm-Message-State: AOJu0YxgebGmiVR4eTOuIJKIwA4ZvUGt07N7p+vnZ74FInbDcgNgNvIz
	nHG4lFlcgEw7M3e5f1K2AUNGeIcHEiYUeRkzNviwpFVzDxKvjFIV6Jg4
X-Gm-Gg: Acq92OGPrGldo80rYvI1PtmQlyMOciYDu5Ihrsygq+Pgg92E+o9ugyyr/smw2zuTkfa
	6vrGpqU4mVOOurl/ATV8cGmGQGP7Du5pyPoTKdHb8AxaaqPlPWgtIrsDuS6C2Rc2otm55f7BaZS
	g+C0evgFgyZYCJwMe8iw6yzDSM8VLcQFyO9qRwgHDG8rSZvQLIuFOR9WvM3zwcEoC94lUheUpoI
	0z1SdGbqE/dP2hmxX2hycquN9iz40ehJCceWPZEoz9UD2FxoETqbqOWCGgIxjGcVocwzl3VGMMk
	AMkPTNO8RtQ/CXvlBlmfBlucC9y4uKki5/RbWN2JJJTn70XZB+ymF9ceTK3UOwAf/qOz60ZCr7K
	u8rAqZWXg1sS0+FjSIhaoG2U6IM1dDzqbtVCk5vbf77Le+Lu0UPyWdHY5fGLcvLlLZ28Q6EVFdf
	73CPon6DttJNcmW3dToy1+Iu9Q2Q9VW5gDPQ==
X-Received: by 2002:a05:600c:1550:b0:490:5191:6e1a with SMTP id 5b1f17b1804b1-4909c0beca6mr43790855e9.24.1780051459424;
        Fri, 29 May 2026 03:44:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0403sm2759820f8f.6.2026.05.29.03.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:44:18 -0700 (PDT)
Date: Fri, 29 May 2026 13:44:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Onish Sharma <neharora23587@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: remove unused variable
Message-ID: <ahlt_3J9HQVz7Zby@stanley.mountain>
References: <ahlXYIqzu4O5-u9J@stanley.mountain>
 <20260529101242.10189-1-neharora23587@gmail.com>
 <ahlszyY6Nd9ANz-X@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahlszyY6Nd9ANz-X@stanley.mountain>

On Fri, May 29, 2026 at 01:39:11PM +0300, Dan Carpenter wrote:
> Which everyone is API is the one we should keep.

s/everyone/ever one/

regards,
dan carpenter


