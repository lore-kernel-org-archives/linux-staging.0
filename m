Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE0238C1B
	for <linux-staging@lists.linux.dev>; Thu, 14 Aug 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186346; cv=none; b=E97rnRpTPcP2Bf2iCdgPH4bRmkygFQJtCU+V/7XpfreJDkHslq5Fg4Q4VNcUvfuaiwbgJ7r03e11HMDBi3AfqKVbXnTOk4FPmOPqCqW2kSKXlxEK3Owmygj8P6NkK4KSPwHXjnhFUQ1Ys9EZNTyCiteIxdloJJKLqmaJ26+OEiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186346; c=relaxed/simple;
	bh=8PhsoonV74hS11HznyhtwwEr2mmvi6egb8cha1qlM7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cq5rCdRVj8YLdlLC3Y0reWYrUDl0N2j6yTktWQ9AECRugozhxPfHYWkQ9v9JA6NqEDh4qJd+E8NElf4a5BiFuXfzvSpZZrjg/CT4PwgmnLLBO1Bk6SLYWWHQd6tEl3h1zSXqku3PkgOggmdsuXR57PaVvmLMRyxYJIbkMA3eKwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbDTma60; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbDTma60"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e2ea6ccb7so897784b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 14 Aug 2025 08:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755186344; x=1755791144; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2zPOjzgJ6ei3R7tSEzyHsuGUiKphrQk/wfZ7YvshtY8=;
        b=EbDTma60trp9fVEZaGTtM5vkCEr3XwP/FRs+Stm9qry+cPwODhc7baFDdIJUm2qS8Y
         doUKVKBCHGXWV/enCoUBUty4oAVnfj5kUsV8mp2hs4ztvNbCUIOIvJKXUJmwYQNuRvY7
         JhtuiGaCM4fDM554vs7ERa5xzujkQfCquiTCgseCCjWuq1DxRmMUARu6ROA9Flmg/wcY
         SJJDWlFJ+dAde9UIQPQ+gLCEcs2mIHx1EXdGRP2Y+QGmbjxxwJTQjxEpoCdKXinYjfIM
         PHzudW5zXO10N1AHR19WISc317aGoi1OC7RpffI50FlgdiGgYi8uK+NW28tlg5WNkRLu
         0qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186344; x=1755791144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zPOjzgJ6ei3R7tSEzyHsuGUiKphrQk/wfZ7YvshtY8=;
        b=csUeMrACSSuMb8X1zCAth+isjMwLquaFdbipFyB30t6I5GuO763zPDKAXq7zWufxKW
         kqGWYMj8u/V4166C+Jgg6ZvIL8cJSPtM4lsJ9mZHggEhJ+8EEkFS15NMdSF7LGZnduF5
         ySE3exNCNkSqCqS0XBneJmhtvwL6GoxO1/dPedFE9+hIVz1XNNvTwQqMm2FeuIuFbOMD
         D1P9MfMEv6wmsfarH++KlsXru47P2TNz+Cd8zWJQD7XbmQKvSqnmecXRTNSmi5C2mu0N
         VpjQDhopF+j6ANcnXYGjhMdMuhWHhyRBTt/wLMbnHgh4vrBss1x/YtHC1vwfPW7PhRjC
         rw3w==
X-Forwarded-Encrypted: i=1; AJvYcCWJJpPoXmh3rE/2XlAKZwsZcSzND/1JbKV5Rmlr5USdqNajxKfrfUewyzvMEzIGyCvu5vYEmZ8iR1q1gQ0g@lists.linux.dev
X-Gm-Message-State: AOJu0YyrHF2lhZNRL7zYqnitMO8WkIz/v/1tqGjsTHjT6A6b2d7mCc82
	1tbIVnjzpeSa15/r5b+PIbWUsj+hHwVMQxxdOCBMOxDzTvLCUfkx4tE=
X-Gm-Gg: ASbGncvuERzK/xkEccuTdIhGW0a7RmSkYOAaJPtXRpjUG22WJAiNSXgEzQpsP2na75u
	awYe29KXx123qbMaykT1zUIJj/W0cQ9bdAuXpyiZWKWmeilBWQRU1g57JFmAnML9zfHMvHVX565
	YUrPsFb7sGdQx1aBZuY5fLPSbHqOPdTtzf2QFKsMdyzjsF/ap6XjG6x5e2hGxUiUEjEzgaT8QDF
	lB825ue2YZ3P+ANuRtvwqtQQ7+S0QiU7KalKj4xNM7KXdfZcpN1evKPEAAA3ZqdgND8fByTa3nY
	1PWYHZEZqYbmIF0P11on9K6AgcD6a3X3p6d6ZKIbztL0vi+h6uemH+0vEt0uBj7avSMfpaVCpk7
	16Y6AWfKExUMQKUTTjcXsdlf6+mYQrcUxIN+MTcP7ft5x3g8gCg4hrpAxa/hY6tbctKUl8Q==
X-Google-Smtp-Source: AGHT+IGlxL2vO5rbswwUa03fBzurJOLXDC3ZMd0abz8+oqyFcg/bSZ3VQpRRuzxa9ZBIROVNKsj8mQ==
X-Received: by 2002:a17:902:f602:b0:242:b315:ddaf with SMTP id d9443c01a7336-244589fe5e0mr49988975ad.7.1755186344057;
        Thu, 14 Aug 2025 08:45:44 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241d1f1ebc1sm353014885ad.67.2025.08.14.08.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 08:45:43 -0700 (PDT)
Date: Thu, 14 Aug 2025 08:45:43 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	ayush.sawal@chelsio.com, andrew+netdev@lunn.ch,
	gregkh@linuxfoundation.org, horms@kernel.org, dsahern@kernel.org,
	pablo@netfilter.org, kadlec@netfilter.org,
	steffen.klassert@secunet.com, mhal@rbox.co,
	abhishektamboli9@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, herbert@gondor.apana.org.au
Subject: Re: [PATCH net-next 1/7] net: Add skb_dst_reset and skb_dst_restore
Message-ID: <aJ4Ep13RwUSdJZfb@mini-arch>
References: <20250812155245.507012-1-sdf@fomichev.me>
 <20250812155245.507012-2-sdf@fomichev.me>
 <20250813175740.4c24e747@kernel.org>
 <20250813180313.284432a8@kicinski-fedora-PF5CM1Y0>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250813180313.284432a8@kicinski-fedora-PF5CM1Y0>

On 08/13, Jakub Kicinski wrote:
> On Wed, 13 Aug 2025 17:57:40 -0700 Jakub Kicinski wrote:
> > On Tue, 12 Aug 2025 08:52:39 -0700 Stanislav Fomichev wrote:
> > > +/**
> > > + * skb_dst_reset() - return current dst_entry value and clear it
> > > + * @skb: buffer
> > > + *
> > > + * Resets skb dst_entry without adjusting its reference count. Useful in
> > > + * cases where dst_entry needs to be temporarily reset and restored.
> > > + * Note that the returned value cannot be used directly because it
> > > + * might contain SKB_DST_NOREF bit.
> > > + *
> > > + * When in doubt, prefer skb_dst_drop() over skb_dst_reset() to correctly
> > > + * handle dst_entry reference counting.  
> > 
> > thoughts on prefixing these two new helpers with __ to hint that
> > they are low level and best avoided?
> 
> Looking at the uses -- maybe skb_dstref_steal() or skb_steal_dstref()
> would be a better name? We have skb_steal_sock() (et.al.) already,
> same semantics.

Sure, will rename and address the rest of your feedback. Thanks for
the review!
