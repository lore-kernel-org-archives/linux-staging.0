Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B25035B639
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 08:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598627; cv=none; b=P4/pAIO+VJHts72vf2eic0OkHpUXWOp0iUtsz2wdwsB1KVzx4rHce7QIxMFSxKvY7Y2HBA2lkT9uu8oVCQqIKO3EHCJfsVI3XpX48uzYoNiFH5grgWMTM/uQAUicO7CbnVytSRpKCSh770WOZNpaT6PeyVJJO7xCqW01YHpmmRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598627; c=relaxed/simple;
	bh=T1AV/q0So3wtSODTvpImpVvvDR9NsgNQ/yWyR1E89oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdkMSLPg5XFyO1jwQPZur0geAAWPt4+tZ60R7STTouqiDCJhih6XfkWC1eRPG+TSJzBJpxgUZJBXy75ybvPIHbyKnmmiGGkUhBsarNB9QZLLVXfklehGdxO25hdaDu5iaSGh0644zwTosPwxiJfSuWXPIWsZf6+IrWOWM+9iWwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hng38fmA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hng38fmA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb14227cso22155325e9.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 01:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774598623; x=1775203423; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o2vl7BmUaRFbckHv2xt/l3kp6wOvkR8Dj1jivAjEmLU=;
        b=hng38fmAYe/rk7OhXT/NMaY2q5YE7w5eBYv0FgGrK4eb22vT4ixLy7Q5ZsdsxulljD
         n/65EyFQ2q685pSxwkKHd1B/z9mMsi4WjzgQUzQM+aYIoymo0ZYg+5VlmL/h3LQvH07k
         XWbRYps9qXkIUgUnUOdMtktEkrnzWYP0KVQxdzXAOfatk8sBrp4brXU0IpCOkM5a8vI7
         W/AS9mBxVMEyet5aBH3eTt7/9/1M4rZTYbKZ07uvND7qqWktXxc5kqrRg7b0BiQryYfN
         Kz4gKKiIcoWOqw5jgV3UaHX1FGvyopm6nl2J6mVVRz3ImRXTY9TAMR1iODDe9EZtK6Uj
         XmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598623; x=1775203423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2vl7BmUaRFbckHv2xt/l3kp6wOvkR8Dj1jivAjEmLU=;
        b=XC/M640RjFuX0az39h0jCe1mF8mBEqIswCKwdnf5nOJmKmyybomdd5cI+fuu3Qm8M/
         g9Z8vqMyBAsJjtTDxgouO7eEwAEz8fBHN1mCMYntsxTww5Dpm1q5c2/4tmkr+CvxifHD
         Txo8M1pwA7u+Eooh0VAhHNw2P0no/N4vQcJdRiSKd3xsYK6NqeoMOcsKzCcj4BnnMjbr
         X907TQ/ipVndvhYeZo936ojJxM0t5x7xmG/a/WkhPX6VDA595P1tyGWygPZ6CkdXic2e
         ZIN9vMWanydTeWzD6DPB7XMBzdLnGpiPLIZmIEP2G6kEHKobTPykxS3lRVfJsi5gqmVH
         HP0w==
X-Forwarded-Encrypted: i=1; AJvYcCVeip3at/P19nuvUMvy79PoSN8zyJvfrtGJ9RnYb9rJNlmuzCsGyD8HnZqWagS5ZbBuc6cTmdU2pCNk/fLE@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0Wt9b2Ge7H0+QrX6cCzFVijHzGcot4fDQkzuKoBakRuZD6d+K
	CbAThZdhyG3xdCi4Z6HjokSc0ZGQ9NMXkMfWmjP6M4EopO1q1BeR5eg9jX0KjNiZZUU=
X-Gm-Gg: ATEYQzzvTxUJ9l0Go5croL+fioD33cVoRaSO+0ZHEnIQmam2AS+3YBn874wA45dAO4O
	viXSkaLn11/JzdaX+jOp8c6HhtZuU1ZPMceqDG0129RiZGEvOUrEHPWdmhKnVaMTiuoXxfJ5i/a
	kLcimQz4zNXg+XP6XB3hscMQ7dA93seL00NWUrAzW0o821eyHLSSQnMyG6nXPtUP/A2zggiQvIg
	MUk7BK4tImIf3ENdiMFoqsoHa2XcBJSQF4ICCp43eHZa9OZw52zWc2EQhqHfX6Z2xs3pOwtRgc4
	QFeW62GHTr50BwHGob0ZRD/3Bw4Rbzao6fab6PrztDNixaF3QEUwr2EWc0O5g6bSPxmEe4ZHnWv
	Ecf6iw+x0ZjV0C17thCcp/JbwPtcHsUSS/FeyYWbrQ6/5t50rcuRUE/aF8FMKMK6Nu/NYOwTeld
	u8QjNc6YXkO26rmTcpI0fEtFSPr1P/
X-Received: by 2002:a05:600c:8b86:b0:485:3f58:d9f with SMTP id 5b1f17b1804b1-48727f405fbmr22135135e9.30.1774598622979;
        Fri, 27 Mar 2026 01:03:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270dd790sm20927275e9.5.2026.03.27.01.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:03:42 -0700 (PDT)
Date: Fri, 27 Mar 2026 11:03:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: MrXploisLite <arokigaming@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove spaces before tabs in
 hal_com.c
Message-ID: <acY52ww-3P1bkdsn@stanley.mountain>
References: <20260325235519.36499-1-arokigaming@gmail.com>
 <DHCX1V89Z0X8.FWX3O4KWXA9Q@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHCX1V89Z0X8.FWX3O4KWXA9Q@gmail.com>

On Thu, Mar 26, 2026 at 01:13:25PM -0500, Ethan Tidmore wrote:
> On Wed Mar 25, 2026 at 6:55 PM CDT, MrXploisLite wrote:
> > Fix checkpatch warning 'please, no space before tabs' in comment blocks.
> > This change removes spaces that precede tab characters in three comment
> > lines within the _TwoOutPipeMapping and _ThreeOutPipeMapping functions.
> >
> > No functional change, only whitespace cleanup to comply with kernel
> > coding style.
> >
> > Signed-off-by: MrXploisLite <arokigaming@gmail.com>
> > ---
> 
> I believe this has been NACKed in the past. This is just changing
> whitespace in a comment, it doesn't really "improve" anything.
> 

Huh.  I can't believe you remember conversations from 2 months ago.  I
had to look it up.  I did NAK this patch, but the reason for that is
the the alignment is wrong before and after the patch.  It should be
something like:

		/*   BK,   BE,   VI,   VO,  BCN,  CMD,  MGT, HIGH, HCCA */
		/*    0,    1,    0,    1,    0,    0,    0,    0,    0 */
		/* 0:ep_0 num, 1:ep_1 num */

So the HCCA column header is over the last zero.

Although, looking at it now, we could just delete the comment.  I think
it was copy and pasted in during development so the author didn't have to
switch windows back and forth when they were implementing the code.  I
don't think it was supposed to be in the released code since it doesn't
add any new information.

pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[1];/* VO */
The 1 here matches the VO column.                 ^     ^^

Check that everything is implemented correctly and then just delete
these comments.

regards,
dan carpenter

