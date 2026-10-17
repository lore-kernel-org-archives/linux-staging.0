Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09F43C3F4F
	for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 11:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235022; cv=none; b=DeMOVrbMgqJaKRsNLnKb3J0KhlzWPSHixZk0hmL38qsYMqe8q9IasWyqId7CXCOcmmKeB4/d6dHK3CNBk6RMcBF33TtD/IJoQw7IMOr0aZGH12Xgl6xSLeiMVYgrUu/bY/9oNErbKXJuv7t0bDYxYLkpGUr+tpQiNpdCoa7chww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235022; c=relaxed/simple;
	bh=oSHhfe/3BMYwK1VKmmdxm9bRYofruDGD3Z9oNPFvSP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYS9A2YrsSoqo+4CI4o2zIfawnw5B+tvbaIJYWDpeqaXNYJ0hnoPkM+OGF8F+SRSYdvKACwMaRMBuAjpULZowYLJsvuyF29GMi5Tcpwzr+yPzwxM0SDMqydjBukKKia4J/jnMFQMGarFG7KXjTgXhzFk8aIeS0v8l4VjcM6fz58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=palb7koI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="palb7koI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso1409745e9.1
        for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 04:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235020; x=1792839820; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GaMI/trTcfwmLC2pSab0mIrGT4oZ42vsgle4U84qwIM=;
        b=palb7koIvRPsO+zMSINYCA/gAJNe3tKxHEIDKkXMaa5yb9/H2u9/bCHBZXEwHn4zuM
         JNreTnfud0IyLNndw4QNExdtQObnGKA3NKl+T5j2eooMJWU2bRGXJdwYl5ZfuVTeXFpL
         ANQ4DaABXTO8hA9d1CVNCcN8CXjjndxPfKRa4dFcNUIvHgXyGYinfrugExnXlTHa5bge
         2TxWTaiikqi/j4N8jEd4nfZKxbn2pgPE6OPu/FZDX1zGXgv+hTXn/M8mmYnBQR7tICGf
         tdOsyYsx6FK2aOELhLVo/famAyZFCv8EsJzwA+HZ6xALHTjhCsvBeHtOj6BAQ2Fnz+ke
         XmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235020; x=1792839820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaMI/trTcfwmLC2pSab0mIrGT4oZ42vsgle4U84qwIM=;
        b=hjyMJYnlD92RzAkUKvA8NyIZW2/UB39gOFVnMNmxKitHoj7vWvs73mQBIFQ+49U03y
         bdHgsFbTkgZ5DjEA7YW6MkZCuhjYIlPm+IC36sMeqSv6//DEXs+ie82AqENtrFx1C6gK
         DhmDLPaMC+K0+Xn1WEJE40cyeRthW+7l8KKO6JwHGdGNT1xy7CK0oM2moUbUWJOhf3qP
         i2A9zWhpOo86EH9E9TPlfEfRIGEK9hc0PPjJNSEDmtY7V9mkRqi7AkallYTNjjSiJlds
         br3P2dy2MWYwjDM1j9LeEAzGoOrFUtDlihPUJVESX/9udXMT5DrCuwPwSH11JiM23BAW
         EvEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+a6YWO2UURW9Oua1ZaD88m3tksbJByYO57QpSKHmJp9u+stxEknJW1CkBd1R3sU0qa69mmASf0gV0L7LX@lists.linux.dev
X-Gm-Message-State: AFq9FYI0QsBuZhLVeXqBBNVtoJUufA9//9TIJ4tYESu+kxspi13a8sQ1
	IwdUlzksb4H+rmD8+9S2SJFqzFTshbrQmTKI0+V3ITGgNfk45MXhUSU2
X-Gm-Gg: AYBFou0+DAf1jXMiYbcBpmVTGmB41D98Uin6WgtNT5TWfecUVQWcNJ5Ej3MtyT5Z4eo
	wM8lo4Kf/MJNhth4wrIxxIQyDZVDQEZ/vvwHuzGuvmxEvBjsycmYsTrPdjGOSDxLycpRqGPXo7G
	+X/AEmO6cA941QFjDKOUUiNr2M49hqg2LZC+YHoHC/1YyHYs11yRT5GV6sb1XJiqCZNV43aJiVf
	nsbOo6fMyEr3zyDLcxeVnPR0CI+MkOlQECXtIYMAVSwFPyxqnOE6jGCLRRtOorl5Dc520QQVFrh
	WOuVbIF/0H/kjQLNsWvSUyZU9GhusUsxNuDkbCC/J1sC7QWXQo3bjpw3IScO9v3UirtNnCMnsCz
	4lDSp8Ns4ztbkuoG17Nu+2O148Tq7A/NBVd9mZOly1SqMIyPqdHncEibUgrovuGXazNZLI+cu1t
	mSrAsDx2lEtOyE9bDCJHJpyFKsnANvU9t+xCl2H5NUs4xFPySUVrHrS/29IOV0bQQpqLA=
X-Received: by 2002:a05:600c:34c3:b0:4a1:df11:45a9 with SMTP id 5b1f17b1804b1-4a1df11472emr13188475e9.4.1792235019771;
        Sat, 17 Oct 2026 04:03:39 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca26dc8sm87804825e9.3.2026.10.17.04.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:38 -0700 (PDT)
Date: Sat, 17 Oct 2026 14:03:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Feiyu Wang <wangfeiyu_mc_code@163.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix logical continuation style
Message-ID: <atNWBx-Nr9jw_-sC@stanley.mountain>
References: <20261007102212.112463-1-wangfeiyu_mc_code@163.com>
 <20261017103525.6203-1-wangfeiyu_mc_code@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017103525.6203-1-wangfeiyu_mc_code@163.com>

On Sat, Oct 17, 2026 at 06:34:44PM +0800, Feiyu Wang wrote:
> Hi Greg,
> 
> A gentle ping on this patch. Please let me know if there is
> anything that needs to be changed.
> 

The driver was deleted and no longer exists in linux-next.

regards,
dan carpenter

