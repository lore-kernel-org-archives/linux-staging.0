Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9329E38E5E9
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090432; cv=none; b=lWAlNcwvSSrNcGMqNQGpZ0UubW8KhCEWcIES4P5LkNax8yunSfHVvJOs6+oiOu2oTcMfTD9/UMOgIVg7ulpCTk734EPZhtAwrtcdQ15UmFVAbHoY9WeYppIj0uX2O/h5D+YyPFG5dd+dH0UYRdFs1W7Zg606QzSWYBKKGj51Jj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090432; c=relaxed/simple;
	bh=9de9cennl/VkLfcdKI+tiocL72hO2WSdjd6RPZcIHvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aY0ENEySHu7rgyk1ibuU9tuvhnTyfP1wHARoFLkM5myKmXoaVa58zBzx5PLBI1CCasuKeD7Ts36Yd96teKocX62M+YryA0OxIkevCNNL1POpZdBxSBgdCA2MMMHFyrabYNzAm3yXqf9ZJJnDTmgJRmUwtZhAMhtPR6RpkdmquyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QZSduf+f; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QZSduf+f"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so3354395e9.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 23:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772090430; x=1772695230; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jbJIiDdbcCatfQeAaNBXFJN6hczMbqAEzSc1JtFci2E=;
        b=QZSduf+fFxYGFT5nbqfO+f3B0ijXuKvD0l3JQ/UXWEQq/OdyIh3NqkcnRA7RypA06r
         pyQ1upOo8lf1fRZQS5LclQdTc+29O5Mn1PYfGnfZruuKh371bFEXW84OJdQQxeRDPWVM
         6+Sv2zJFOzu5AE4V+cmlNxGNDOoo1rUUZkazaSuwiWoAEIPBEAof8FJfpbGE+arAsXWa
         umXf3aT2jVRpHQZUbUzIwpjC0ED7R29wtxjTUcnWWgVDRQNdWcaFGcLiAv9sd2Q14Xdi
         bpY/OBDi23qEbtFrHwZRUOBbY9WSFA4njdDUjj+xKNhPKJbwoJByD5R+Slo5ujmhW3/R
         dqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772090430; x=1772695230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbJIiDdbcCatfQeAaNBXFJN6hczMbqAEzSc1JtFci2E=;
        b=rNoIxnTcLrLqfQZVAjpPro9sgh0DofsSUy4e6RHJdXXN2lkU94/7LYSzpm7N7LhxHg
         8o5Dtqrqp9uTGplb3pcc8U722I1quYb2TjlTIhP8jJbQ7sIPctAl5fZ7AaZa8fnipClN
         FqnOhUG9z0R3fcGXq9HbwE+xQolZ6f9pP4rPKVy3pMcjD3QAni+4FLE8o/ZMu1VSBho2
         zKV/V9Uer/9O952QnS5xeMVXO7tcCeduXknUPweQIp9sL04tvkiAA3EXjXJCqYVSWgZo
         GS2VhMCeFDy5JgrIqRaV+/ZsPtDtgWnoM8qlV+5b4oNolqDdLkZet0zo24TkTqPSiyXd
         v9cw==
X-Forwarded-Encrypted: i=1; AJvYcCVocH/s4Trj3XDdj/oMtory3SrzqpUkfMBdnXnW7AkCcp/Kls2eShJH29411tF7APkcOkpD5yq96ibmoKna@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlarsn+GVz8p+ZsuQiZ1eDkJbw0aPqzQFIY1THKnrHiWQS6YMp
	8/86EC9BKhXefiuNqytNg3M+3bXQ7U8dcZYxDMxOkkzFm9e183fjct9YBlAvkCSun/k=
X-Gm-Gg: ATEYQzyDSE2G4jB/REY6IK2o4poVKcxbl5eBAJ0+jVMzWpiHiWLaKxNhXHPA18IhKKZ
	yOA9uFGu9MAAhLGqATka97AGCImJlEZUPdIIQyMlFrs3MIGU+bSqiPXBT8NbcGdaaFMMEpSePlm
	f2O+IAAr66kB+3RJc4PhOnX4kY/GnfqOSPrM7xmReFU1FQom4OGRJpZ9sK8qn651qqOQzvyaP5F
	vL4ng8oWnKVlntiGnLxGTB8yGrVETonkM3sNK14SS7pALETpPVcKzLsrUUxul0BLOFAwDzMBheS
	H/Q/mmFQ/3iANbkFW2gQN1mU6dJ0mj5kXAFvzvNzEiSMRyUO9KvZjn6h7EBCqm0dJdsa1/iZ9KG
	HqxUKnQU9v8LFnmRwIwdzRhwA7FhvbstcBfiOQYvnGoAyDfMXwR/Nmdo+9arT1ynkgo/gD4FZKc
	LdgYVoSD+ftQGJZglNW7mwpSuD6gPC
X-Received: by 2002:a05:600c:8b44:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-483a95eabccmr307599365e9.27.1772090429880;
        Wed, 25 Feb 2026 23:20:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm37432448f8f.13.2026.02.25.23.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:20:29 -0800 (PST)
Date: Thu, 26 Feb 2026 10:20:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keith Teeple <keithrteeple@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, s9430399@naver.com,
	andriy.shevchenko@intel.com
Subject: Re: [PATCH] staging: rtl8723bs: split chained assignment in
 xmit_linux.c
Message-ID: <aZ_0OratIkUBNHmy@stanley.mountain>
References: <20260226001019.1100684-1-keithrteeple@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226001019.1100684-1-keithrteeple@gmail.com>

On Wed, Feb 25, 2026 at 07:10:19PM -0500, Keith Teeple wrote:
> @@ -15,9 +14,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
>  void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
>  {
>  	pfile->pkt = pktptr;
> -	pfile->cur_addr = pfile->buf_start = pktptr->data;
> -	pfile->pkt_len = pfile->buf_len = pktptr->len;
> -
> +	pfile->buf_start = pktptr->data;
> +	pfile->cur_addr = pfile->buf_start;

Please don't do it like this.  Do it like this:

	pfile->buf_start = pktptr->data;
	pfile->cur_addr = pktptr->data;

Otherwise we have made the new version harder to read than the original
code.

regards,
dan carpenter

> +	pfile->buf_len = pktptr->len;
> +	pfile->pkt_len = pfile->buf_len;
>  	pfile->cur_buffer = pfile->buf_start;
>  }
>  
> -- 
> 2.53.0
> 
