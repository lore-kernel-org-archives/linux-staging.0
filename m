Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7430E10EB
	for <linux-staging@lists.linux.dev>; Fri,  2 Dec 2022 01:33:23 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id f3so3191624pgc.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Dec 2022 17:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oregonstate-edu.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=coXRMGLEnULR4Px2kIXW9NT/uHpoi7n2zoCrf9vdf78=;
        b=wTlAV1kXsfqE2xmIbJjVCKqEY1ddxhtAC6UP3xApmsb2QY7hJeZwOjoJ8sjp/1ADTv
         q5LwWIP3od3ojw3n/VuoXt8Oxk3q1oTAS4uWaMNegFrGSnWIIbzLEK887fq7+VmOntZk
         udZyr2bK4VRKzOTBuRevRDO/zwSjfjhu8o7SZ18e0Thq6o2VEL30ZkaSrh5L19KF7Uzv
         YFPbeixjF+6LgoqiaWRqyP5eEprIOiknjBg101Q8u+LjdoT52rG/a8NxL5Dwig1UhHQE
         wtqhxUElUpFbRthRdryeJraXGEtbF+aCKs7BUC8vw20vks9mJzsLS8MGkby6hOVwEp3F
         bGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coXRMGLEnULR4Px2kIXW9NT/uHpoi7n2zoCrf9vdf78=;
        b=VxDf1AhTEe2XVqHpKjjByJSv7Gq1N75q0WW8qFGXAJBQXflV1+6Fx+ShIfAce72bM8
         ESm1NbjS3KWfNqRRjsnp82pRa56Y+scNO+OJ841ufSUJAwl6KVLpVjuP499SJ51pa7Fr
         GpV9xwL1sGjnTgyRkXEdrts7S6WkX+9JGpjUBXfrqlUd5m89SIYYzltNkUSyIJME9ew5
         8stnRGPlt/8KjY5Fa/CirBzYltNfep9PeuTdGnNJ/BO+yC/B/VVozEtosjkk/2yCt0x+
         ZF3icOw3BfPPJN9ZllKWAQCA/YLf98HC3D2y+buZx3n/MSxs7yvCr3SkhyUVXEI9pZTx
         85hg==
X-Gm-Message-State: ANoB5pkaEnr7Tb32B3zfeK5EFIzfmKSyGY0fx2Zs4hmZ2oK5Ky0uMlmK
	ilwxJ1/gZi89fSRIQHBBsYx7dw==
X-Google-Smtp-Source: AA0mqf737okP2UI9PkpWbPqWCTRqB3u2oaPJpG8WqZLZ9K+my1/OGPvy+nFPzcrFgteV6seCrUAfCA==
X-Received: by 2002:a05:6a02:20a:b0:477:cce0:28f8 with SMTP id bh10-20020a056a02020a00b00477cce028f8mr33832799pgb.89.1669944802839;
        Thu, 01 Dec 2022 17:33:22 -0800 (PST)
Received: from ubu ([76.27.231.73])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902b71200b0018990ba4985sm4270708pls.272.2022.12.01.17.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 17:33:22 -0800 (PST)
Date: Thu, 1 Dec 2022 17:33:21 -0800
From: Jack Schofield <schofija@oregonstate.edu>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging: greybus: Cleanups in loopback_test
Message-ID: <20221202013321.GB5097@ubu>
References: <cover.1669872193.git.schofija@oregonstate.edu>
 <Y4hU8oC7H5h6G2ZI@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4hU8oC7H5h6G2ZI@hovoldconsulting.com>

On Thu, Dec 01, 2022 at 08:17:06AM +0100, Johan Hovold wrote:
> On Wed, Nov 30, 2022 at 09:38:49PM -0800, Jack Schofield wrote:
> >   staging: greybus: loopback_test: Add blank line after declaration.
> 
> Nit: no need for a full stop in the commit summary.
> 
> Other than that, all of these look good to me:
> 
> Reviewed-by: Johan Hovold <johan@kernel.org>

Thank you for the review. I've realized I've left off maintainers and
will revise and resend, with correct maintainers and the correction you
suggest.

Jack Schofield
