Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFF55820B
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706306740; cv=none; b=JDb5aQxjmBB0HEudKEgKSeu2Oav10IQyqhxDvpNXl6Av9oEW49LtCedxfq3ar2OxT8O0hEdfh5xSabady/CvhHyBT6IMwBKvHGpWE7xzkpAt1fEfIe229ImTt1IMXSkgIgXMwZ+Oi+1iXX+P7c/JtXBTKNdzyo3W1w8aZjd04bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706306740; c=relaxed/simple;
	bh=NjzHxkwFiRux9mikDPOe6otV64eagfv0IasTUR7XscM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdNTbgv2jXmQF6Gomla0MukRraitAy2LcUI0+WCX3mZNMHNtwIH0EmbzgE3vdl0l/zfsg3KIlpMvEUWeGj/GGlDCYbVgOS+5SfnRoL4kDejnMHhRMQDR5SyCqLTPytaNNxskqv2kfVSGtqnScijQFMQBuZQ1hvcEmhTQj1dOEdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=FpWt4NQ6; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FpWt4NQ6"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6dde173384aso568893a34.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706306738; x=1706911538; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/VNi32mgg+yaX8sJi0wYiHkUmSSEvhk85dc77SV0vE=;
        b=FpWt4NQ6vUq0WTLi1UDhCm/1rBqloK9LU7zcQDLDeA1rvLXppfI2UHtTnS83vJYGHm
         cfZW8XBeJt1o0PPOaku14dPOH/eLFuJBy6B0u1f9+S35++J8hqVUCj4CROBGagXrXrRr
         LDqbfVrDnDNkWUpKa6qMDS4kjEeUnV9kUBpw05P4l5PzTrbwnrEaeTW/8JkRitoqwHkX
         YVDdqnwwPENbZ0lVZ9zuT/+yQqiTFgevs7qNWceb3X8Hg/rWLcBd+P9R1qgfFusxv4mO
         ubUsPFGErTe2QshVmaFY91ndwfvImpxR4RI9IWgeG0gujl1d3QtkEf1Xnw4fTLi5XtcB
         afwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706306738; x=1706911538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/VNi32mgg+yaX8sJi0wYiHkUmSSEvhk85dc77SV0vE=;
        b=mv44ccd/3Qevi3K9CWWZviItglXp0uLk/aJyPhRcev4yKqPQ6AVMVoj5wE/WMCHFWQ
         ytYEwjxdkNPghQvOj+jy90bM0v02RzCAM7cOuS1XLJdQecbdQRPxCN8GNluy9aymTyoz
         P8Pd8xajFEmDsCcfQBt4PERjMHP+ikSa90NC4KTwM+baKwf3O3gknEohbqq1k4eSOOCF
         v2awjVXpTLV4/GC+vbD6JKGZUPCmyJJJ2BpLA1JmOPcNntxPoiNE9zC1qODIV2uGW0cE
         s4M0pxg3qNzO5w9/qEurLOAZMUiBrUoz7XLceMcTBw5XrtqJ90pPR6Cx5A3IQgf7vN2m
         tsFA==
X-Gm-Message-State: AOJu0YzJ/T1bDG43Q9JxR1km04to4w7fEJRknc59LUqTKmXuh9BoLiiI
	BDYVD4RCgJAXkz+8d6jeFkt/3XMw3XMjRfaAO8FYzqQ99GDNs0CoFJMi1refXH8=
X-Google-Smtp-Source: AGHT+IEwJCrhx+MQIyoLzKnEzHD/N8+lNTGWSq5rKg0iFkAmLUSyqtlpDBnwIfkqhUOWwgdDnujh6A==
X-Received: by 2002:a05:6808:b2e:b0:3bd:58c5:8ca2 with SMTP id t14-20020a0568080b2e00b003bd58c58ca2mr430747oij.41.1706306737870;
        Fri, 26 Jan 2024 14:05:37 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id r7-20020aa78447000000b006dd7b08b336sm1583869pfn.20.2024.01.26.14.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:05:37 -0800 (PST)
From: "<Tree Davies" <tdavies@darkphysics.net>
X-Google-Original-From: "<Tree Davies" <tdavies@gmail.com>
Date: Fri, 26 Jan 2024 14:05:35 -0800
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
	anjan@momi.ca, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] Staging: rtl8192e: 18 Additional checkpatch fixes
 for rtllib_softmac.c
Message-ID: <ZbQsr1OKNwlcTUSl@oatmeal.darkphysics>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
 <500c7df9-7347-4ec7-8952-5f221cc83ef8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <500c7df9-7347-4ec7-8952-5f221cc83ef8@gmail.com>

On Fri, Jan 26, 2024 at 07:23:35PM +0100, Philipp Hortmann wrote:
> On 1/24/24 23:44, Tree Davies wrote:
> > Another checkpatch fix series to be applied after the series titled:
> > 'checkpatch fixes for rtllib_softmac.c' submitted by me, to the list,
> > on 1/5/2024
> > 
> 
> On Patch 2, 5, 6, 17
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit
> description?)
> 
> On Patch 13
> WARNING: 'unecessary' may be misspelled - perhaps 'unnecessary'?
> 
> Is working fine on hardware.
> 
> Bye Philipp

Ah, Thank you. Will send a v2.
~Tree

