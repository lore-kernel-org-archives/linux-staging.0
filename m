Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FC72F44;
	Fri, 28 Oct 2022 17:52:06 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id b185so5376084pfb.9;
        Fri, 28 Oct 2022 10:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vxp1g2Xmt0Uo27W8SXGteSZYRsjJHqr727Tb4bslW3E=;
        b=Q9qKuLvADx6+71DawtNgaRF3zchoRqnNiuk6IX+f40y37ACZJgi6NLu+oGOI2eFiK+
         8hP+One9mDmr9BTk00yjw23BDLUQRVWDOpjd+yVfNMRh/wA8YROkn9yUlYd8yfjMmoiK
         dmF7xbBaMflNW7OC8JvugJ2AjI62AbiDcEJp4vEWGg0d93Hcewpq2GTbe6YZCpqxxLdX
         Tmu3qxRWbZeZyq2eKTYfu9qE26a8OVrAlxU20IXpadzcfMSLcxR/Uo1rTs7FMSAsiL8X
         bbusGg2u8x6jjuOPys5zIrpjtEaDRQV4eWYlVkv17KVwDEAYziscBrPOyGrPKB/uhsDx
         ld3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxp1g2Xmt0Uo27W8SXGteSZYRsjJHqr727Tb4bslW3E=;
        b=hnSv3wQeazJ1yIAJmNhzqJnMykMdC2S8MEx9Z5hUAxXVZN+sGGjDWno/IKKp9tTAZy
         a5flY1Tl/xFPJJBc/yLjr6MSbd/E4gvMEokKLoAADDJ6sPCD6NOu2SNV5B1nZxr9AkMN
         WT52qy/oBY2qjzku32UbGOk+KJa1KX4utgqVww7I3h+I7Lzw/VOS91oWxPaPrpXDrRMi
         UqDFbBwswa45e+YRQ0QYgh02k3vZhusTSu3sfqcT1COdCYo3jMgcbbRZtvNAJCCd3NER
         f/chMrKXakQ7KW+WFcH/I/YN1iooqH0gIlemteQKJkCse8C2oKhnkruSWavEQab0Sugi
         +aDQ==
X-Gm-Message-State: ACrzQf1LKabgS9vsF7UVbUZGxtt4lZ1Gs06mh08IQOivvZhMDad1KRL+
	giWG2iIIqKyH0/YTP96xixg=
X-Google-Smtp-Source: AMsMyM7wdKJlMh5bMtecumc1yFHyIUOROjCTgEhBgc689Omkh7ENzstbEvgi16kBYjXnqoPapl8qkw==
X-Received: by 2002:a63:85c8:0:b0:46f:5bbb:737f with SMTP id u191-20020a6385c8000000b0046f5bbb737fmr607990pgd.93.1666979526328;
        Fri, 28 Oct 2022 10:52:06 -0700 (PDT)
Received: from marshmallow (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id m4-20020a170902db0400b00186a2274382sm3364286plx.76.2022.10.28.10.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:52:04 -0700 (PDT)
Date: Fri, 28 Oct 2022 10:52:01 -0700
From: Emily Peri <eperi1024@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace ternary statement with min
 function
Message-ID: <Y1wWwZdlXNil/lug@marshmallow>
References: <Y1neXqVYZ8mq8jH+@marshmallow>
 <Y1oz/w9qfwQ+8gWt@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1oz/w9qfwQ+8gWt@kadam>

On Thu, Oct 27, 2022 at 10:32:15AM +0300, Dan Carpenter wrote:
> On Wed, Oct 26, 2022 at 06:26:54PM -0700, Emily Peri wrote:
> > Ternary statements that pick the min of two values can be replaced by
> > the built-in min() function. This improves readability, since its quicker
> > to understand min(x, y) than x < y ? x : y. Issue found by coccicheck.
> > 
> > Signed-off-by: Emily Peri <eperi1024@gmail.com>
> 
> This breaks the build.  Use min_t(uint, wps_ielen, MAX_WPS_IE_LEN);
> 
> regards,
> dan carpenter

Oh! Thanks for the feedback, that makes sense! When you say 'breaks the
build,' do you mean it didn't compile, or the module didn't load (or
something else)? I'm trying to figure out what I did wrong when testing
it.

Best,
Emily
