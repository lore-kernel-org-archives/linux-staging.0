Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715A0268690
	for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125831; cv=none; b=foJONVgH86sW5C1Sj8427nlo8OHePtj2WiVAm60SfQzE7hslAZ9HOtKdBUb8fbEeanspcee5hny8K4NO11koQSi3Zj0KboRd36RqO30U7/KVUzGk5EPdE6GTnz2vCA0BT1EZ5Yf2RMcVRtxHz3Q3HuZKdxg/L2cWU/l6cGxiA2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125831; c=relaxed/simple;
	bh=HnlDWlV7nCIHS2w3Bfo3f4BCVjnoFaqOKKjWakeiO60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JV6wP4VhTvlnlsyIljsuoei5s/YqFRRq6MMmhdjTSID169GDZzt5mxUy5//ZI7HdEOO2lSSviu/9oYn/5C7vchbIvbCxKeI4um+8OcwYQ98s1oHNLWn67614dkRO0KHPiIgf7jJQ1gvdBadL9ZKrz6TiKmxcb1mVkcIITJjgisc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Li/S5tgC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li/S5tgC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so11185945e9.1
        for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 00:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125829; x=1787730629; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1xTC2q/BWntL5hamUpphYUPdQshPoAuJKKit6UOQN/I=;
        b=Li/S5tgCdJcQ8dLzdtPlmYpDknekK1IwSKlP3YJ/BtyWaEPwi0hNqfq+fxt+1mQBE3
         mCmqHNq8zKZ+hlV7qtDw0q/ygaXsrmqlwZ9soHAVH+ZEq9vCYWAERp7mLuqDQJ/yZRQt
         ACZ0NkcpX0FQble6ayMb/xSnezNCTcy5UJ5buG27SiUnSh08lEgnIBHAbbw2zFYcr7f6
         +xg6XZW7uqQNmZvpQnhR3gZqng/eHVzv7sdr0TRB3X4phowUW/lYpVjxBVEUVZzJHiP5
         rMjt6hU73E4KTKTsZVUuCfk/PpPeWsUekoc0uRAYs/RZ7Qabk4AZ6PbBa4h+c+Awy9nV
         ggLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125829; x=1787730629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xTC2q/BWntL5hamUpphYUPdQshPoAuJKKit6UOQN/I=;
        b=q7uX4tVcYBub/DPPeJ0tyJNyrz83nZUCUyTjyLRVhi1BZK7Ykm3p0z/mArHoqCXXca
         uDbcbtsVf5ExD2UhfK2H66rO5j3YHxCITEUQzuY8ncsdarWjXWh2Tp6WN1TgXLUEEIfv
         SOk5ZjBaSa+/INtsntqg2+pFAx7Xda5Y8Ycz+vTJkcE+wjxxZzecVHyKEaBWHCLTm62I
         8n4GKRaLJ96UY94a0PMsuRCAHHESBjSo3lISPpfWvlFJtXi6rwDitkyXkQRtzE68z+ZW
         1a0bRGy3E5ppW9aavEJKCiq26w1iC7i21DfdmLO9MvzuZZpHhuLAnHMvG45VwPVNBpIl
         PecA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/fHHaEOO3Niswg4eE49ixmcSeVyciJ2Sw6PL3ozT1mubN5MgAN+H9ewOYBPTzFjr8Xnfhmu8tsFn9WUNT@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5+TREpCa5X2rWr+CWRMrvz9ZvS3+YwJFuPuXo1p3SYLJiivM1
	2D84gnS48z/tNWI0qZd3ejCu6QemNsKGj8vdk/bAibNXVCFmide9kESS
X-Gm-Gg: AR+sD13NZLUCoM4yDJ/JgLk6Ut++ei0ja5JO4fbNfrr1qnlUPhS4t9Bc0hljy6U3lF2
	ELFtYSZdDWelcVXAjTAvFAqO2V0VtiMiDnkO3eSHDY6zTQgqNNljxiu2EYji1bS0Ij53ITmXosC
	1ZsPkBxdOZzsN7GGnqvjl2XcF9RcjM3VqoMhGUvk9A/as/WjwQ3k8oegH6Nnr3Eyq4X9nKYmosu
	2/SdO92WN2qwbQq0rSyT3nYWK7380/d3n7AGU+j1l2hxGfG/zUrej0M8VUWETb6z73I0QVrtuxE
	bs6njcIpSEDpCJnHB0MV8W0KloiUbh6wdTP1xbXYrPHmkVHYBK+2kukL2rR5KAiiLCnZE0xi27D
	+Hmxcn99Vp6xt/ENxu6AnWar+4rvfWq3dB2MwQhHo669gJ/eSAXxNlkdpk3gX1ZGE+TtCvCruu4
	BQU/pDid7JsyCXVgHkWXPzJMajFZjz3T1C4JXfNDZXRxRgDt04WCWX36sV
X-Received: by 2002:a05:600c:604f:b0:495:58fe:88e5 with SMTP id 5b1f17b1804b1-499aa0aaeb0mr28785065e9.2.1787125828606;
        Wed, 19 Aug 2026 00:50:28 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c45d1sm3380695f8f.30.2026.08.19.00.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:50:27 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:50:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dhanush Muralidharan <dhanushmuralidharan@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove extern from function
 declarations in header files
Message-ID: <aoVgP6Cg7NSO_zxR@stanley.mountain>
References: <20260818131601.96509-1-dhanushmuralidharan@gmail.com>
 <20260818152055.486-1-dhanushmuralidharan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818152055.486-1-dhanushmuralidharan@gmail.com>

On Tue, Aug 18, 2026 at 08:50:55PM +0530, Dhanush Muralidharan wrote:
> Function declarations in header files are implicitly extern. Remove the redundant extern keyword to clean up the code.
> 
> Signed-off-by: Dhanush Muralidharan <dhanushmuralidharan@gmail.com>
> ---

1. Run your patch through checkpatch
2. Add a little note under the --- cut off to say what changed

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

> -extern int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib);
> +s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib);

3. Don't make unrelated changes like s/int/s32/
4. Also int is better than s32

regards,
dan carpenter
