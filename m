Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BCF36308B
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063717; cv=none; b=oav+BDsuipcLY1O/3CegQc/3HV+F1O4yeCUfcfGD3XcaeLighwmAFZn8Wd8heM23U9+RGNpnMAt0xG7p1Yek8z8HsfxWVITxp5bjXbfoixbaRYMp+v8ygQFd2I5gf5ZZU606j02t5FGvUzmKelA2Uw1sAg0b8oNBL3EHmF1amTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063717; c=relaxed/simple;
	bh=OQWhhxZqYKALJZ3N763IzPmDXKZvPVfT1efgkV7AF2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAZMbYTDdQTFbjqTwPMFMMiBwN2Cvmq85HaZEZeeBv0DmrPuMZgBe1cXLoWZiJ36OlEIeWkp0uGPE8k2zHyWWzQ1CkJ3/Z1vN6i8lpx9en+sOEfzJ7lDryYLTpVAVTNivb1qbBv9KCFeD/MWYZq8p3/5JcXoAcB3FxGR7C04H+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbqUOq5S; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbqUOq5S"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfce3a195so2483508f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776063714; x=1776668514; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8CjsWBGHpOx6h2pu1a1t11cz0On6SSLxT2QaJ9+1BPE=;
        b=BbqUOq5S00X1QobT0oLzCJlcH24lbmpnyUmMA2jA4QmyGOOck80J3LNEIUGYPKWNm3
         76uiZzoiZv6p02Rcn6MemcUpWgbprazAZFwrtviRrCKBv4eeQfz9sHudaN+MmX59TH+D
         UnXpXW5BvJ8ibSSnVygaKV4i2kuyz7ed89sxbmIubKuOwyGRn6iJkQyUDCjIQQiHXp3e
         wZ2kt1asE9UNS32hET1z2+MvCmU7Qd65mZILq5kJwcmqogTYJWp9Wb18d1W0pmmSuq/t
         uCxsMkCvoXpoNmQ6KP0qnlmLzenzfjb7n+82g2QSUVAvBildnoWBSWWxYYpZtmXSjPQ6
         tn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063714; x=1776668514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CjsWBGHpOx6h2pu1a1t11cz0On6SSLxT2QaJ9+1BPE=;
        b=cNsgn5ADB22FfI7Cerc8gY1x2ZpB+jzE5+/u/mWQlILhZNCcg0D6BhtdhLBD5foYVe
         vTMrwnaJMA7X+gjTEa+NoSNZ/o05/0PlZGs3hmUSOSf/7zNscCJMFitgX+TdJ0jZicbH
         CZDl+cYuifyHW5N9sUvzg7gf4TfDzasZAvMR/mu4JYdsIKZUYFhTeSVkggC0q61RDWZB
         7op8wB/NwVj7U1MK1N0ryv2FrE5h0G7xHdQwzsXSrlbPMyo5Zea+S3gNfrYQAseR/ioK
         Fvx4xStxosv1/cqszVT8IbS1xqPjRICA+99i4FDlgKib+5bARP4eFFtXcTwMiEERXO4L
         PWqw==
X-Forwarded-Encrypted: i=1; AFNElJ8g/+MAKg21iL4rPnWXld/OeFk1yrhu/5MW9HP4XsbNi0/njQwK5BAB6LU+04OwCoQ2qF5srJ55R14Md4Oh@lists.linux.dev
X-Gm-Message-State: AOJu0YwZyFfJ1msVNsWQrDqjII9P+LcOrvyOeE1OGNY7sdKpKCIEHU7K
	CvGm0iFcguejBXu0c+25vLD6GEawUojYDactZNWpUq1gkwYAFzUoFCTu20t6zJ7Q
X-Gm-Gg: AeBDievyPitRVvLvo1vAnwkn1W1dCq+E75KMKApdjz/wbxkgW3IkMR0ONlz2tEZV9L9
	weMgu55WF7KRNxjgiy/fqekma8hqPnBS+EbGE/fgfhVnTGPLjYb2jCnRoGj5sz6Xkc6/d7zZ/gA
	0KNs6XWXDhWThdmSKuCuG1W7CdWvEEUHu9OHrIduYxbDeFuy/3xpDmkoDa8KhnTmciFxiho8RdK
	3EV1wHqEHGYsv1uXQHRAVzPzAw72H9ZzBgw1+s8BPDuCLFbSKSlDTzXLZCqIteLJPjlVTXbs+ms
	yt+tsw21jawZZfPTKt7cRH+uSZDRTGKV4agyTY2u0/l5ycKkjEnyD4JmNdXVKu5nQTc5M22+8Q8
	6n1RIn0dc7Dk/oTD9z9nhlP/MAn4RDGGmAQBG4EcxqrfXhJgG4C6XtdApnJEwEEDrZZ8xTYgqqq
	4PfzrYMAxpINNWnlMOkKY=
X-Received: by 2002:a5d:584e:0:b0:43d:781d:37b9 with SMTP id ffacd0b85a97d-43d781d38e6mr3972596f8f.42.1776063714250;
        Mon, 13 Apr 2026 00:01:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7b543057sm3291602f8f.6.2026.04.13.00.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:01:53 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:01:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Ugrin <mugrinphoto@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	David Laight <david.laight.linux@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: use umin() for strscpy size
 arguments
Message-ID: <adyU3gvOhmUNX3l_@stanley.mountain>
References: <20260411005512.46142-1-mugrinphoto@gmail.com>
 <20260411173405.14485-1-mugrinphoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411173405.14485-1-mugrinphoto@gmail.com>

On Sat, Apr 11, 2026 at 10:34:05AM -0700, Michael Ugrin wrote:
> Replace open-coded ternary min expressions with umin() in
> strscpy() calls, as suggested by Dan Carpenter.
> 
> Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
> ---

LGTM.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

