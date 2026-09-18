Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E381B4973BF
	for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733893; cv=none; b=UaXgQmhxakS5fca3rH98v75fZt8zT4XicnatXYRIrSqNSmIV0kgiIynyi3OpTj+hs2GFhXQ8Lzw3D8MxecjxryYItZKox0xjvbPmhYT/AIdq7VUfpvS/tz7DsFqST15OpfotkUZ4BukcAnkkUqfc530X88aLMyeXVFPYVByq8fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733893; c=relaxed/simple;
	bh=GVsqfgiWc8eTZ6lOwVDgYX8+hEo0bQcqz2KYQ4hsFW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3OXBd9Em1pKbwqUfYwiX4mwi1LF31xmdsMxPFhBT95495fuO8QYfj3xMFVPleUJceCpbOh3EC+Y8qOSBW9QcFzah1MWFowThBdNi0HXnDT2rSfySOyabS69QbHoEhrpng/ivdLJAwVP0G0IK62m89fxrzMLKeY9sKOPaPFKWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baPRn82a; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baPRn82a"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso7322545e9.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789733890; x=1790338690; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45onKwevpJeLdvAlZkmdd7zV/NiPer/Q7lLdr0dAxJ0=;
        b=baPRn82a6qrf+047BrvEyKM9wrLoVpzwtVU0AKyWx4b/KJXaFGNvMoxFxssIr/UFG4
         TwjdfEeXoxf8PvwDUGzQapvTNnG2QLOkgnnaqi0OO2O6lJlCxXrA8Yr2wFBoeZAtBspX
         BF9zP1factZEVN2ldv5FWt7mHSwX6lPDZjtAh2pAAlVnPb4H0bSnJVfw/SgjIbG+GQ5s
         lM55AK9zKaOCnEmCv7Xtr0nLxULLFfTUQsxj2bSm6ETVdOr13GODHzPvQWrVujFar2ve
         UjSmeXbNcC0p2aonWhWEnXXaTGwfY4sNfoZ4lX8jRjueVJkRu1k9d00PPnXzX7lsU7Pe
         jutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733890; x=1790338690;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=45onKwevpJeLdvAlZkmdd7zV/NiPer/Q7lLdr0dAxJ0=;
        b=0IMShe5C3gCSaCSpPgcvQRsc6qFhpOHgJaq5qSBF/cjif1dT9NLA5BfNACPW/m5p23
         XgN8ZSBAq0K6DByoKSj5eHBBO2ZrhCu155HfK4EmAR7t3cFvwIq2Iydl0jJJwdGUw35x
         A2g36z6V7upinT806Y8dK0loW3kzB2geBD3cuNPGpk+JJ9z/vfXtPjhrhC+frlxuTLi6
         PBMsVfdSB5XdS21Vnw4tCFScBo4ZnVOvJtjIGyxKv7HB61Waq3X+RPI0zWhCuH8iZ3sA
         l5MZeENjiftwCeCRKbhLBiC3Ed5nL3X6UwIP3jqj0YroikQdL/i/RdzKTrxPOBnCj0Zv
         F29w==
X-Forwarded-Encrypted: i=1; AKwUvBy2fwl7ipqYBVxKYk3DWY+PL7dlmPDKMMm1qoVF3GoI6ATdJCbVbvuJVpsRtGQG5o2DbjKXu3hOOYHPXqsQ@lists.linux.dev
X-Gm-Message-State: AFuF++m4MB+5iG8bonGbGQO8Rwp7mTHNGe9/b0+QmLU2MjP6Hl8JIAru
	EC3kOLk1erLiUSsN7pjIl6RSDWLOTT8mzshVWvsv2bZoolRzniHlgTN6
X-Gm-Gg: AYBFou082wrddCZAbN/fyc2NW3jHlAvUOJI02LEtb6FuRwOQBbg8xzwBbt3BColI0Bn
	f6g77KX+qMnDmyp64gRNRSVzc6J7ztwQ1NVFOXMDZ+EVcz+Vqnn4Ty1F5OQHOjcfCA7VvxaFBF6
	NWY4Ss7yzdPn1gwfVATGuiXvN/CxQfP/FYKPHBH44PT9LTllcHcw4qakPiW+VvzBjWfa6FELeLa
	wAwdeU17jme4zruJFjS3m7VvUpD196wQUvzl/JuW1SBoQ8VGeKvhsbonwbZivY/+2IJ2m5nYQ0p
	5zSLHPnQkSJZl1AWIOXEHXMlGvdA/aNRSlKkRHb0iu8l6scG2YVVrDT4HFS5NOVAvVMZD1QvL24
	+JDfc2vJuBM3oIigWI0ZEsPV2QNbZXoLboYaDYKSqDRyHVKYr3/0PC9emZyhx3/jTUFoJ2bLfjT
	fxE24pNjC4KDhEfxka7mlXmmXwg8V+X4HXMAmIB9K/2SKRfTFStF6AT7W8EK19k3j06oo=
X-Received: by 2002:a05:600c:6206:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49fc5735339mr29623045e9.21.1789733889912;
        Fri, 18 Sep 2026 05:18:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcab7e333sm33701115e9.7.2026.09.18.05.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:18:09 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:18:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in
 rtw_mlme_ext.c
Message-ID: <aq0r_XwNzLQBnDku@stanley.mountain>
References: <20260918110821.1117935-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918110821.1117935-1-vladurares@gmail.com>

On Fri, Sep 18, 2026 at 11:08:21AM +0000, Rareș-Mihai Vladu wrote:
> Replace msleep(10) with usleep_range(10000, 11000) for more
> precise short sleep. msleep() can sleep up to 20ms for values
> below 20ms due to timer granularity.
> 
> Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>

Better to search the archive to see if this has been proposed before.

https://lore.kernel.org/all/?q=chk_bmc_sleepq_hdl%20msleep

regards,
dan carpenter

