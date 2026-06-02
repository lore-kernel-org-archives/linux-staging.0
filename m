Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7831D3E0C69
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 13:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407543; cv=none; b=hjrm8Z+HB2AIBECQrdE+AEMQrR/Pffu2rZkJNJkgzfgjFHiMSMLJCNzekVAdcdzT7C6YKt7BFesjxtpjN7cLJvDxAfWOq7+Xi5X3V898+EeIIm9063Di86zRScskSY665xMgoY/vtDXmzxqbdcHdqv9cfCoGkMBcG8tE3+X6dvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407543; c=relaxed/simple;
	bh=ZlTbIgMZvarBl1ECbGtCjVCPTtmmar20hacxFRh6Wuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhluTWfRU2EkuVH19i1KMHAAy6UW6Zs82l9K+9zz5A7cRdCO/fmm6UfYgt+JiRg78u8hLYJf0Daj+BE065vASxkRKbWTziGDPqERQ5goN9pqPQ9Vnt4kzz2iQWg0zFdub+vV32iX3jnX+GtPJOmW5H6ElcIJxoopQpOnqt5tTSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zx5IvaCr; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zx5IvaCr"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68b482888c3so7315724a12.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780407541; x=1781012341; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0cOztZqPoUk717ss8/D/BbRRexRjj5joOSNpYcM+a8A=;
        b=Zx5IvaCrB03mArZiK9/8NwL3xE3Gl+2FhFvZxLKVFssBiGnHqoRBmsIf2JMByd9WUN
         U6o2rwBqX1cWPPJfg3N5hcHs/7/d4fjFM3iIZpBxd4HAwZzc/vpavbmmgPzRO4ycLLm/
         c07W0ThJDP2tjiJdS6KV4AzHXAcqeV6Nwz6xsjwRSNqogZR6h9mlsZ2+88XH6Baup31w
         ASqnohe3arseY6Q3HpIFFSHL/UnwIN7zUgSGceEPakgRSuDJYcVh6jXs+bvKJjoHDaTx
         Rgvs/vSWZcdL57WWthxf+1NZnlDg5kI90TADMm2Wb0/+tK+NMy7GBBJv4R1yvUG5Pk6S
         99vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780407541; x=1781012341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cOztZqPoUk717ss8/D/BbRRexRjj5joOSNpYcM+a8A=;
        b=pg6bbLImZyfUgblQwNf6116G/TPwnNB7vQl6BRrRVTclzfi38U/BQsku9O9JV2SdR1
         pnJ6JHKNROgToS728yHXSq1+hhRVDGIbP2us+aU6vfkVi33Lw47qrb7fts4Jebawh3YW
         YoCWICvYT/Zk2ushPPGaKTF/iC5A1X9bgfT9B+MfOVmaWj1DI0oBmK9Zvez9LML+pe64
         aIaEmQOw0i8rDT2ZfKxSQKdKVCSb+BE1cSeqXwolCjuywfZC3bqEtn+52RUHVjp9pBkr
         gwHLDBSjGhDCOaS7YF1qJut0YfexxZ8+YeTYHn6ZFJvZyRXKcl4aFCx3uGI6APG3gHPW
         qUNw==
X-Gm-Message-State: AOJu0YyXaEtqpSpZcyyfBcs65HUBPO66h+eS5z0zZNzG+kb2treNGlG4
	yxjIlQMT9+c+poXEnXg0ZBExDcV+IYV8W01IviVcWGL09w4VOXiWGgUR
X-Gm-Gg: Acq92OGkWTVfo1kPDdJ8UQofdeYeYyxVKx49l6ED0yffGg6LswnA8b53R/S3yL6hc/m
	/rXQb0TKfcJbI/tDTSjZpfDAr7joQmOqDVZPvIcYyOyqmCYNkcXpOL36zj6n+RJK634xXlLqm2g
	o+B0F5A9urn2bOqjFAuhf9L7RNQYH26reR4HYyuaoTH7h8HZg7a0QscQLPM8XMfD+mqRDlzFME3
	vb5Aat0quM/ajy/50EjQXCBt02/SGr+WwvTlYwp7JktvXXBYLtWd2c6VWoX7T+fWtaqSO0vStEH
	AFPnSh2OXVUF7kDvTFshflmsbDTDIRogWjZlq2apV1GcWP2P7Td9NP5z+GQc8ouBrCfSd09hvoz
	rpmkbvs3cLvkxLI6erGimEmlhD7QXG5UYdqKSd5Jn0q9qmJRhUf8IIBtyUjqVeMQ8TsPrnrF7iO
	3alAvLHzDJkN4Iv98Wwhb/0FLnkD4WRA==
X-Received: by 2002:a17:907:a089:b0:bdc:f4ef:ac33 with SMTP id a640c23a62f3a-beefd0bf98emr258053966b.20.1780407540678;
        Tue, 02 Jun 2026 06:39:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bee4092940asm208482866b.11.2026.06.02.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:39:00 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:38:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-iio@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: iio: addac: drop CamelCase from adt7316 symbol
 names
Message-ID: <ah7c8XZHmvWu5eI7@stanley.mountain>
References: <20260602132534.101554-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602132534.101554-1-inasj268@gmail.com>

The V in Vref stands for "Voltage".  It is supposed to be capitalized.
In this case correctness is more important than checkpatch.  The others
aren't checkpatch warnings or style issues so they're fine as-is as
well.

Also you renamed some "DA" things to "dac" and it's not clear why and
it's not explained in the commit message.  Try to be more careful
about that going forward.

regards,
dan carpenter

