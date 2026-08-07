Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AF519AD90
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786128405; cv=none; b=rHAA2uongCDRG4SOq0aPRaamk71qTSQtF31edTo40zGx1bcOj3PtfTUt6TcVqZB6OQsDkGxTxHGtETwRA08SXr9bSacl7NmnAJRKpsVbG5UsvN4R5HyZcAi7ZXQCXcMLC+1rKCF/9nxdGrhlcszzBbm08+r2OfueQN3uNJwC//A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786128405; c=relaxed/simple;
	bh=Mt1zmwVvL7C599yV/V47xybzdFZKP2OIiGG+KWvil4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWb+i6OYSUmnutdIX1OFy7y8LVwUZwwqBVSifdzTi+Lp3Ag3TeQQTYoly2n143VENGpxcsxX8W7YcLgICh5NrAsja613D6plo8nHZ9hohwivjOMvmPJj6/bnfhLQffi2XcsQkswVIbAv2B9Sg90Nr9ukJ0sIxaKi8NmLPf0bbNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIHzTa+y; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIHzTa+y"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e65e18969so194505785a.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786128403; x=1786733203; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eWr9SPLv59B6erYan06Zql1/BzjBsoX4KKVRypzN09g=;
        b=bIHzTa+yiWAL1ZBuZqAGH1+39VSoa3G0D+XZCtdK+eL+ZZMPMFDW21XJGYPVBKY9uh
         b7zEXQM+2v8LCV6SR8r6w2vdjioFB1f4i3tkOuW0U/7VpVLpJ+zzUSuGMN82S4wlDU7o
         /eIVi0jRPxI8O9SNwJFPRf8kCfx7MrhaVAOOKp28E5vkYaI3SJOzgg6ObbFfxsp881qy
         Zz+MemyETR3y+MjUWb+UsGgJlVcSEEyEuTK10adq7i2Ey/ihx7rbjOm263wcEsMa6VWd
         twfg5QGRRd2qUj/MwxxIPRWEAZReVhyBW8FZBZh3rht8DECEdcKpHX5O8Yhd79BJZHv3
         I5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786128403; x=1786733203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWr9SPLv59B6erYan06Zql1/BzjBsoX4KKVRypzN09g=;
        b=kkko2Z8McMDDn6UmpULzo715jKGewPLW7ogBOJYE7Vm2MQg3UOQvrE6nhVr51bYPr6
         p/6BRhI3WK+1OR0f+jp+VY1yegXx6Vg46RDbsw3fZ5IP41sOZONopun+mbGvuLTp4MJ9
         V5Z68LhxHapPk9cloN+c0F1EYcsVgGE6X7hkZZ+91XYyTLiimte1+aHyQ9W18l8IyiH4
         GxKkvU7R1a15+OS7/t6wDI/eyndYAcBGJHyE6o3QsyiwH9duJ5jfmUIjUbHQJh3XC9C7
         1g8EWweLxqKM8ZVUL4wVdAyJzYkeuj8B7h0bhn1F99yNzOwjRP56UzuCJyJNgjo4Tuyl
         q4ow==
X-Forwarded-Encrypted: i=1; AHgh+RoKwKIDBTCQIasnKfYqLFVcdNNej0T+FowNdoPF5dTdSgtjQoyLCWIEtAPkgxWvrAnLYccvNKNe5nfYopfK@lists.linux.dev
X-Gm-Message-State: AOJu0YwMD6kznODo/3bweHXJkFZo12UW2uW4HRHHOtxTUeV1GsQ9KBgU
	v2+WbgVCQo+C1+g5Oj6VUdq1P1Du9TPQfKPcqxnTjKJROCvf62IzDRy1
X-Gm-Gg: AR+sD10NRkcZwnpHmJ+0SU9WMorsDmeCMjxSBa5vi+H5rLnt9IjJzLop30rfQHrzAXz
	Du/8Vj5Rgre2iXLnd90hSqFLRrmI1CSqKQMDvpHyNorBHoxwcw3Iw3rqfpwdXQOstelIsH/pq4T
	bba98fOiOH8RpEMRI+ah/HMAjVKh4hFFkGmZyWDjyOIrE8sGzQBcRB8VEgjV6pI6jGwIQrxkUm+
	FvEIM0ggZuAwr22hexPo7yQJ1YKcdnLpEadQJErwg3o0Pg3riPhxFQ+69ISy4CvF+mEuB1GjaLj
	bSHWnbPo1tj3OsaFtjSwORS4bpBkaVCz+6vDIByTw6ds5bCq7W4Q6BZ6fKFOD5ybDqygSNIRUYU
	9eHHxhiXsLKfwQ9rzRFfrniiSQelcngQEhp2i6ueoIn0EhGr78EK6BP/HuVtjGjkt6XBgTo8Y1k
	M1ymyJZTgy84f1HM+gUc252nzCzr06Y3lHOq0JaVG1vpaddXPTlDH6am6yX1h4T1nWrLj4VZ7d+
	KIr
X-Received: by 2002:a05:620a:1786:b0:929:f78f:6bf9 with SMTP id af79cd13be357-9367b672642mr91596085a.16.1786128403331;
        Fri, 07 Aug 2026 11:46:43 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e0c17fasm210195185a.21.2026.08.07.11.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:46:42 -0700 (PDT)
Date: Fri, 7 Aug 2026 21:46:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Punnay Sharma <punnaysharma805@gmail.com>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: media: av7110: fix corrupted BER
 reporting in sp8870
Message-ID: <anYoC44F6SrKW5iC@stanley.mountain>
References: <20260807183443.13912-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807183443.13912-1-punnaysharma805@gmail.com>

On Sat, Aug 08, 2026 at 12:04:42AM +0530, Punnay Sharma wrote:
> In sp8870_read_ber(), the 14-bit Bit Error Rate (BER) is assembled by
> reading two I2C registers: 0xC08 (lower 6 bits) and 0xC07 (upper 8 bits).
> 
> The current implementation masks the lower bits via `tmp = ret & 0x3F;`
> but subsequently overwrites `tmp` entirely when processing the upper
> bits using a direct assignment (`tmp = ret << 6;`). This logical error
> causes the lower 6 bits of the BER hardware metric to be silently
> discarded.
> 
> Fix this by using a bitwise OR (`tmp |= ret << 6;`) to correctly merge
> the MSB and LSB payloads before returning the metric to the DVB core.

AI uses a lot of really unnecessary words to say something very simple.
It explains the obvious stuff in detail and ignores the important bits.
It should be something like:

  Checker tools complain that the "tmp = ret & 0x3F;" assignment is
  never used.  It's probably supposed to be ORed.  I don't have the
  hardware so this is untested.

> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

The fact that no one has complained in 21 years, probably means it's
not a real bug.  I generally ignore these ancient things.

> Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
> ---

There are a bunch of rules for sending a v2 patch.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Don't resend the same day.  Add a note to say what changed etc.

regards,
dan carpenter

