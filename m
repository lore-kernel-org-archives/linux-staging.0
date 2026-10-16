Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082EB340DA6
	for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138999; cv=none; b=eUfjG9e4Lye6KPoRAJTjHEH/G5gbAW6/a8P+/RozLjrKK/Eo39pEeugLQ7vEZ3PnjJhofGv9z1sZijnYJCCpskW1OU00Gpz/aycX6LvN9rIdqm68Hd9yRtgBQw69U0HZY7Uc5dajp1ym0JMHbaPKBhVWazPHjAOzfQLF5FLTfSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138999; c=relaxed/simple;
	bh=DZv6DDtHGtCUMGuVyLhN4xONwNMm186CTnQ12diII60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+UK3c79bgJm70vJ3VnXkWJv/wRi/lWi3qcU97X9xj+z8JgWjziNUjIKmec9yllAt6CItoSMaTh5Prqad9mlG+x2iy6Yxy5zvbgQUlaI3WkBLYEUKxGtmMsH1kQDqeFsLXRkqrsG0TTcc78YXHoFK/e9w8t7zJ3wg6fqu9BmBs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWWwDRmp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWWwDRmp"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1183259f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792138996; x=1792743796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7TWEwY0SXVP+rEBDt82SB2uJBfpkWKtnhEnFx3Zi2u8=;
        b=GWWwDRmpuqKr0RoaFZsZYWIS7FjJE3E4aj83UgcLXnopMb81UX+ySGmUynupc7Wig/
         ObafnDQ5O1uFO8Ej82auf4H6VogScM2dUlvYVLymnRzE/EnAKC6fBo/bTAksJ64sPij/
         ZqfgiPbTfkWpFC959n4Jr/r2RwYjQ/QiOaV8tQFowFcIZ3Hm2t8RVdO/HUQryWB3BEbQ
         NPfU5JFA/ZWrgaqZyut8sbUlzoezk/6M56Sv4BqgNMzgS48zHnf57EAFDi2wsSAQdjqq
         vPly7sXjuJTJksHCo1fZLZ81dqJDUw6VG8X93+j6gsvSbXjsSAEBVPoAJ3QLCpJ50YPr
         WWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138996; x=1792743796;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TWEwY0SXVP+rEBDt82SB2uJBfpkWKtnhEnFx3Zi2u8=;
        b=awS2YIfqIWKBkQYcznprFMdsmr3SLpIzbdHqg/HsjXEqf/+iZNclYBw4HbUcwPvWwN
         Os4y05ggHWKBtV4vzvTZLiqUClO0w346mfXgcbJGsvkcHPmBNkpxrZ4IAR509r39QSyJ
         2TMSOjqk2F90MuNDYx1NMtYSrml8nc1/NShHXQ7ejHfFUUz23NJbHHWJTCXLrPHFyaK1
         fcB+T2fsnZVTmf7JcxkVaAXcp5h58z22GYmkVhvxlCAKXs2zHcDJHWcdxx795vH1EG6+
         BfWbP2/S2VnpSDH9y+PN/ewP8Bhv2tIdgLZgC/hCdXqYNWwPXHkpVW/Wx3Xj9kwxzZ6C
         U92g==
X-Forwarded-Encrypted: i=1; AKwUvBxbpCItA5vZ+mgmiIXPM9SDXHpnOvN0PhmePcINDUMke5GlzAK51TbRtq+yHnOCAhacXONzHa1B3k3IihB1@lists.linux.dev
X-Gm-Message-State: AFq9FYIstKDxyzcrUIVyO+zEoD8iiLrBM5MnZt/g4PylCqLzVCCmWReS
	xBrQI77bim64hCUovr5eIJhNGJNVNIHQV5XPayv7jjLUI0Ya4eryi54n
X-Gm-Gg: AYBFou3TvIRu+f0UeFvjPCMv4cnHy+2HsfFqTccztCtqHPlXA54pGzwq3azCOZDkNkW
	SWh/WdnM2iig6qOm2JfVmERCqVtmPa/rDWjeka/YHBoBR1M1GUFrSGL2JWEsQE1WLOMqmmh6wxS
	x1vEhRR/cHwuOGOjZaWW/pRP1fbawcHYh4kaLv4h0Q/rpm3Q+5yONrf+HB1IAtzch6a8E2zBPuN
	1Oat4bUk2qKm9ppM8SZmZdQcoHYOjkktEiCStO+dHcVbXvxQpiANsZCXtklUipNo/rXRdjgjmWQ
	39pfs41qRpfeNoMOLI8whhqYzXi82Qa0lPgNEH6oy6Lq74+DayDms8a7dqcwTE0v9Xtqb91hDly
	xFG2x04ZGmuobRZSKEkP07RCkuiWoHey4ybbJ86OQrgecXZcn7NGXSmjMy/n+Qpw9cqcbKwUd2c
	ancSEquf8xUhd1M0PA8IoodGm8QqICOCzXeCzQL8rmmAVzYtSDhBi8cT4jngOfYrLnwFRi
X-Received: by 2002:a05:6000:611:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48df1b3c101mr11816607f8f.25.1792138995988;
        Fri, 16 Oct 2026 01:23:15 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm3918895f8f.4.2026.10.16.01.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:23:14 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:23:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	"pavankumaryalagada@gmail.com" <pavankumaryalagada@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
	"dennylin0707@gmail.com" <dennylin0707@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <atHe7m57n3zINclK@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
 <atEtUV5q9MHRSTJb@stanley.mountain>
 <672f78b36290a4021d3f94d9ec401d23420febbc@linux.dev>
 <dec2320eb01dc6499948a936c94512ddfd47e2a4@linux.dev>
 <atHcT5GG8zzoH7kk@stanley.mountain>
 <78e3ad912e994e77813cba1af461c7c1@realtek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78e3ad912e994e77813cba1af461c7c1@realtek.com>

On Fri, Oct 16, 2026 at 08:21:34AM +0000, Ping-Ke Shih wrote:
> Dan Carpenter <error27@gmail.com> wrote:
> > Ah...  I didn't realize this patch was applied to a different tree.
> > #Unexpected.
> > 
> > https://lore.kernel.org/all/7e53bd59b7b146caabebeca4347674c7@realtek.com/
> > 
> > That's a mistake.  Staging patches should go through the staging tree
> > or atleast they should be Acked by the staging maintainer.
> 
> Sorry. I forgot to pick the ack [1] to the thread.
> 
> [1] https://lore.kernel.org/linux-wireless/cbf165fa6213c22e88559081ca1c160375c9009c@linux.dev/T/#m6311fc160b8c020f7f87a3d9435ce02d69d07e4d
> 

Ah, great.  Sorry for the noise then.

regards,
dan carpenter
