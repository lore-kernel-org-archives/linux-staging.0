Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1D028FA
	for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 13:16:55 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id kt6so14305504ejb.0
        for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681564614; x=1684156614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzXYreqeYmp6WSmJydUbNuUOo6bx8j3ScmTlAns1itY=;
        b=o/5jI2eEJPlGzyiPn2+Hq179ixbP06pFO7i0tRo64AQKQv3BmsoCMh3ejMG6ni1eis
         ZaCjqJOMxXbWgJwVMY/MTaabI4ag9AvgU1Wxf50EXAWKmT/UtbY+AGlNXOyEkSXGyJlB
         7Bk59GIb9zvkEQ7HwdPbtEN1XLfZgeA1I4O1awUClFHoFrDvJmIFCMRy22D4rHrVjVFb
         uDzF9OXn5hQJutiMYDVgsm+KbnGDadBKoTZD5vSwR4/ukuEk+7js1z+t6xIr+Y3l19+A
         K3WSl2L8eJ3zPyIlq3snlEZFPL60Yn83ylLQZzXpc+xAo3oORBeoCAl3jGcjbOucK6pl
         6EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681564614; x=1684156614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzXYreqeYmp6WSmJydUbNuUOo6bx8j3ScmTlAns1itY=;
        b=kChsCMQuHwsTMzX/awbLQrQYtW4SqLllSb597jRXCCw+XKY8GAzXk6ZJkBIIQhEGAb
         TuIvdSUV6/LZLgZNUk2TfvTkaXBL4I5nScn/4jgxLlYl+nIj4jzF+SBq6F/OZX0KyYyH
         HfTGX9XkQLubeIptI8aBcQbcRNKGqaWLT9336bBQPaY7/sEr/4ErZ0LwAXNrdiv1vWlW
         3csK0SOXN4zy5zxg+6bvumnkS9lsxr7Y9o7Aq0VBoRtBeXZDcwm3/Q7lQdkrIkhKEnxF
         DDPyYA2FqiC6G/XkOyZWWXqFrVrr+yj0nwdfJNk0JYa2hhSAuDKuixEhk4TvU5FiZb8E
         SQnQ==
X-Gm-Message-State: AAQBX9fs5TTWC7OqIcKau/1H7G/+IrbdUzHSwaMpFjJB2uMjn+KzjOZo
	Y0R6w1hMDIAyzzH6nmNFz4E=
X-Google-Smtp-Source: AKy350bH574+eHb/fXQCB7LwDuC7J12RbSehsjCQVJbOR5bQpYiisRqa3tCAONuRfTjOONLAvRgJAQ==
X-Received: by 2002:a17:907:7809:b0:949:c05d:73b6 with SMTP id la9-20020a170907780900b00949c05d73b6mr1872274ejc.17.1681564613546;
        Sat, 15 Apr 2023 06:16:53 -0700 (PDT)
Received: from kernelhacking.kernelhacking.example.com (dslb-088-067-245-126.088.067.pools.vodafone-ip.de. [88.67.245.126])
        by smtp.gmail.com with ESMTPSA id s24-20020a170906779800b0094edbe5c7ddsm2432788ejm.38.2023.04.15.06.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 06:16:53 -0700 (PDT)
Date: Sat, 15 Apr 2023 13:39:38 +0200
From: Luke Koch <lu.ale.koch@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: replace rate macros
Message-ID: <ZDqM+seGtevADusa@kernelhacking.kernelhacking.example.com>
References: <ZDqKb1iuoSQTYXJM@kernelhacking.kernelhacking.example.com>
 <714c5d3f-438a-4633-a46e-127f876ffec4@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <714c5d3f-438a-4633-a46e-127f876ffec4@kili.mountain>

On Sat, Apr 15, 2023 at 03:43:20PM +0300, Dan Carpenter wrote:
> Writing every sentence in imperative tense makes people sound like space
> aliens in human skin...  You can if you want to but it's not a
> requirement in staging.  There are two maintainers who have that
> requirement and the Outreachy people.

> > -	struct p80211item_uint32 basicrate1;
>                                  ^^^^^^^^^^
> This starts at 1 instead of 0.

> > +	for (int i = 0; i < 8; i++) {
>                  ^^^^^
> Now it starts at zero.
> 
> > +		if (count >= i &&
> > +		    DOT11_RATE5_ISBASIC_GET(item->supprates[i - 1])) {
>                                                             ^^^^^
> This is an array underflow.
> 
> regards,
> dan carpenter

Thank you for the heads up on the (lack of) necessity for alienspeak and
the code problem.
Starting at 0 should not have made a difference but I totally missed
that underflow... embarassing.
I'll make sure to fix that and resubmit the revised patch.

Thanks,
Luke
