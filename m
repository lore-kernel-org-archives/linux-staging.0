Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F70B39934B
	for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 18:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787252029; cv=none; b=GH8bvGNzb7tm3DfkcrNwqAnXdfdDkQkQkvW7hws2T+WBbQKK1JQfVJStpvsh/ywPhPPKA7lHOoxHPmQ+M2148ljMYa2ecU/cli38c78wtYtUTV3ZrcEFrIfYNf6eHWUofvk7YXb+0xB30gcuTmaY79NVy/4a+QuhikjpI5/Jyn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787252029; c=relaxed/simple;
	bh=PiO6Ndure9FSudGc7kYMDD5AO97U2Kyb1pxQ/fIJoCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZ0lkU5Dd1jNzYKzJqLoyZXLb/SNePrN+X15/3W8BAsEpGtie/rPzGuvHiwysF++tQAoyrcMcssmnctUydGcc64vsj3M7aPnd9X5gEvai+Y2h9buV87MKkAp1BTxbMcqzEowRCEtyaIcbUUGvG9t4MYVIgmQge4Edvb1AUPHHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZAsb3uK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZAsb3uK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49800c6a846so1717635e9.3
        for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 11:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787252026; x=1787856826; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kyz2mBOTfqVwcT7DmvS07wdJb/XPjEVP7kC6KnwLamI=;
        b=qZAsb3uKrseua4z78v2MQ4mMk/7nFi2xM0kWjef+eEh03ekZMXj0LafdW9y9qKLuvw
         g9TKLIY2ANkAssti+jneLBe/+s7RoHizf/KLc3e05Sg/zrXwziX7wlc6sF/QuzZOSzZV
         xbpYPqUwrM9JA3oF/SPN4pPn35dpQ+LK8el9+pz7C771USDREuOo6jR96z7Kd1/bAwvh
         yGsSQblCbop320b2hd6CSn8yYRSX49lu2/85FMNyQ5x/y5Iqlk/yKzocfhaSM1cLay+k
         lraKhVKWIEeKG2/uTtWUtX96CbEICv2JrsgfQl+SzxvBsN4t9GBmht3gAuaAjMSqFQTW
         DrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787252026; x=1787856826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyz2mBOTfqVwcT7DmvS07wdJb/XPjEVP7kC6KnwLamI=;
        b=AJwJZrBEuNixQWprqGkFnLCP8YDzbtCkD1Sz0H/qR2m+pFepxp8chd56jA27fD6+Ti
         j2GBSX/trFs9Igd5pjHCTE2oxyMoiZPoQ/MQ4n1rEI6ZoeS1lzLZMS49tLFbGiqfmJMO
         Q5wLF+9lGWg/rghQEe4miKKEWjAYMyoQ+jHTpYGdR8KlqSADaHCHhV4GKsPxDGE4dqlD
         clAJwkYQDVJ5tim1/yZDe7uafdrOtuQeat/D9fTvaGqhEj6XdR5v4twTbg7IgaAdD+ic
         DfKQBEt77+sJ6N5na7Eg++sxNoO44LUZTkedo+VVAMK57Nf0luEK2t/plQW3TLxA0Quy
         ZSOg==
X-Forwarded-Encrypted: i=1; AHgh+RqH+1cLA0H3Z2RtuQlQibHToHtpS/W/7bjjqbEnFc+8kA7xforVPyYs6R7GC2PZknIwQT1LhzsIekFdZ/bA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/+9ndP0nvoFbzMj91PmiWo+Ft2XP+3Vuex2e0tM/DxN3XIvLY
	kwzeiuboSvuwo+4pFrYoiQYcBLkzE4ekmpcfCjCWhxLLCxMy3J2oRHhl
X-Gm-Gg: AR+sD10EJvytMFsH9BWV54sITO5rOBjQm1eyn+tBp77iRvqIGXq1bO9opb2UztRSdwq
	7w0JnM4ImTHpPWzSSpZy8yU+lRNoB8/928OGrVlD+wCl2VQlYiOH1D+zHdEbMeg5WnifjkJduj/
	e2Z7at2cut9dcOssBB87kG3GwStvNMQqMxrNCNg4ThPTHiQmYzF52dij+6+P+FbCj20J1M5knPL
	3FG1UaohUff584Do1BZkw4RtTsyfSf+vhx5Vthr39DizDSearilK2+HF0npFkipBfQcrCN3SIHz
	awn/JhPoccn0zYoCbaOzoI70AysBaV3ySwgtJPGulzbDkP5FDxi3EjjA++n+nvAzlhdZDOcoU2T
	9xSd3sv8j1V0sKYJK31FoRdLhSAzLilBr2gGDwYTH7IGUeTe0sCiqn8COpxjB7ukqoK1qxRvzxn
	w6ZtwczR+QHPwDhn64Y6PfXYILMlTAiVWRwz7Gd6ikUO3Ztwa51YAOCfq4
X-Received: by 2002:a05:600c:6217:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499b8460e7fmr20628525e9.12.1787252026358;
        Thu, 20 Aug 2026 11:53:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b8f750a5sm2505875e9.1.2026.08.20.11.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:53:45 -0700 (PDT)
Date: Thu, 20 Aug 2026 21:53:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: "myeonghyeon.park" <myeonghyeon.park@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: reorder conditions to avoid else
 branch
Message-ID: <aodNNvjuCO8lpQrk@stanley.mountain>
References: <20260820162601.74952-1-myeonghyeon.park@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820162601.74952-1-myeonghyeon.park@gmail.com>

On Fri, Aug 21, 2026 at 01:26:01AM +0900, myeonghyeon.park wrote:
> Fix the checkpatch.pl warning:
> 
> "WARNING: else is not generally useful after a break or return"
> 
> in core/rtw_recv.c.
> 
> Return early when the SN_EQUAL() condition is met and break when
> SN_LESS() condition is false to eliminate the unnecessary else branch.
> 

Just ignore checkpatch when it is wrong.

regards,
dan carpenter

