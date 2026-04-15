Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48463DDDB2
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 16:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776269454; cv=none; b=IZuE9NWzXXp09GFjWUYI5VNuZ8paIJKq/KQ8U1scYfXQ5cOcL/XrQWAhtNtGYG/RDYqeR7E487dlMPZe4qQlaBoYW2jr3U4bEIVt7RuW1IA7eWmOnJRzoq0vziy9D5Cx6CvkUZ6LGzW3cnvwLNHQy6eHLuuA6uAR8mLgWsjPQVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776269454; c=relaxed/simple;
	bh=TFqy6o4yJMYP9GBzn/VpixF2D8RWZVzrJIt9OW+u3BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csj5NPOU0R2Hin3AHS102cMwVEkbiFx5RRoXObqZaq1lGM4rwVrUOgevuzlpTVUmeav1FiD9gfRw5VH7rLzjqkPhTE4nBNiG6UmyOcJMeNOLJ/7d2LFQ2g5rKj/1y/JIDlhY5SCMrdwyupY5YluzVZ9AVKa05XlqQTkWWmvtZ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MC9JWpH6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MC9JWpH6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso107843635e9.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 09:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776269451; x=1776874251; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3u1OZ6uHN/egNKLnYkjqkoshsxT3699KRfYDnljLgg=;
        b=MC9JWpH6dMILy5GcsllDhr54ohyj+ydjLNrcNPF+jqxZspyxCKwvX1EF9y6j1M3Tlp
         ha/pokrp/QWVEPiJz2FCFLd/yPqD3p5gPzTVwME5vRQQd+uOvF7/3vGMfBmJswWKey3x
         Zbgc/UB8L1KIbnFbWUsfsmMy/UmppAG+ctq/hdOjNqDZcBxI2I7tsgRUCH5eUUk2KLmU
         EqGlcoYaJ/bVDMwq8S42sKfGMZeTvFxpDxlJ6/JPyIzxefSOAHAj5KGXTcPiif2lkmkX
         56BDsSU+K0IS6/LtM9JTcqdEAiNuu2GBTvUKWbfHTjsoqg5IfhWMc5vzrIZqqp9nSN0X
         8YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776269451; x=1776874251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3u1OZ6uHN/egNKLnYkjqkoshsxT3699KRfYDnljLgg=;
        b=SzJiZHrWAzV5VVzj3CU1tzQA1mRsUnWeKz2XDq18Fx3YINfKoFB1Nou2VTkHQYuiil
         Zyxrzbl++E+joA2gU40drKJfOT4s7gGSq0cH50xYJ71UZ1k/m79iBA8Kh9T2uwGHpgSV
         EFbtoPbzl0mFHn0cs0otROR6PJMKxVpkvW82ggccG4KoCZwy9DaepdJjHhvpE/OHLFib
         5JS5YgItTeA+QqfVxZUXA2z7uEbK7evPmWUuqPZM8gEFglFSlGSRpnQlr89dWye+iCIs
         X2ePdR1zvafAiCATVmBtD99WvJoZLJejZBMwwRJOn+jj5zuJCzKc4UBoh1xN++U2AJjO
         Q+ug==
X-Forwarded-Encrypted: i=1; AFNElJ97o8YAhD21x/KfyvbUTnN+sSdn4xQhaLFTXEpLU4emT1zXGCeYzwE7lLzrJfoKg4WDptpr167JtRyHPr+f@lists.linux.dev
X-Gm-Message-State: AOJu0YxbiQsgYn0W4/DExI/GOZps8uA/qLr8pq1eLr0huvYJWmvt78qG
	5xlFUjW6HXWLHlSIuq5BbS/+WwkkDTcyVxjDGEwZ6bAYN95/2HFJfps4
X-Gm-Gg: AeBDiesJyGjhHZHn5u1kgniPIJKhLXO8U2k0Swj26BLXERBcYRsMhE3K7zkiKVNK9H8
	G9n06gRE4lZZJ8frdiCxdeTaou/3EV8wsoSRGqo2jauney0Nz16mFAk1yPUDzs9r6KskmfHNqU9
	YfKFfuJ7p89anY4kfL6Wvb8TTGrCMCCiYAXgKv1zKL4KEvNsFAJYGchJEKyZLMSyZm9pX3BOEMD
	JzAQXaRgaC5wU8QBiCaw0cRfrmjd+YPuLYQjbwDNaY8E/6fP+R4hlilcRFanQDfPGqKxOwuMMB0
	LD6BtH5XF+HQBTq2YtgHFjRIvFWRKT1K0wROsWow4B9kYu5QsCRvOiOeIzLGaDkuui4TcVob0LM
	FLceUYOJMLFmBDmLjYOWXbGmtfG2VgkOX6+VmWb1Loh7yw6HaLIuForDvSG+tgDjbK6w3yw7sBL
	ZaiPUkAuCoqG3GQ15pCls=
X-Received: by 2002:a05:600c:3b24:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-488d6872ed0mr314240495e9.25.1776269451035;
        Wed, 15 Apr 2026 09:10:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f1de4ffasm65879225e9.5.2026.04.15.09.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 09:10:50 -0700 (PDT)
Date: Wed, 15 Apr 2026 19:10:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, Ethan Tidmore <ethantidmore06@gmail.com>,
	Sam Daly <sam@samdaly.ie>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] staging: rtl8723bs: fix heap buffer overflow in
 recvframe_defrag()
Message-ID: <ad-4h1qvjR_pki_v@stanley.mountain>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
 <20260405101548.124829-2-delenetchior1@gmail.com>
 <ad-tmii6T23d-kZT@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad-tmii6T23d-kZT@stanley.mountain>

On Wed, Apr 15, 2026 at 06:24:10PM +0300, Dan Carpenter wrote:
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > index f78194d508dfc..717e0594d983a 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > @@ -1132,7 +1132,13 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
> >  		/* append  to first fragment frame's tail (if privacy frame, pull the ICV) */
> >  		recvframe_pull_tail(prframe, pfhdr->attrib.icv_len);
> 
> There is no error checking on these pull calls.  They're supposed
> to return NULL if pfhdr->attrib.icv_len is too big.  (There is a similar
> caller earlier on the line before).
>

Actually if these fail

> >  
> > -		/* memcpy */
> > +		/* Verify the receiving buffer has enough space for the fragment */
> > +		if (pnfhdr->len > (uint)(pfhdr->rx_end - pfhdr->rx_tail)) {
> 

then the pfhdr->rx_end and pfhdr->rx_tail pointers are wrong.  So you
really do need to add the error checking before you do the resend.

regards,
dan carpenter


