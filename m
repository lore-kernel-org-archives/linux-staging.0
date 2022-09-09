Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FFA808
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 11:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6A1C433C1;
	Fri,  9 Sep 2022 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662724030;
	bh=7suUxrvFUF/KkgYl83T/YM3TrdL0T05prCH6RXiZcy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I0V48tMfmGxxXD/VutHGMHHJIEBJr3cTGkIGnEknRHdMsUKhguNcNjuFNV/1yntaI
	 L3xJ6WdNg2DZvndCZiL4QNSY0lQmkPhPUj8YFnkcKVU0XoA284rkDv6RoTRPpx9SBR
	 2YbIlpLK188RZ0y2bbDl+iXp/7OZvPJeYX0AxvAM=
Date: Fri, 9 Sep 2022 13:47:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: vt6655: use memset to make code clearer
Message-ID: <YxsnzortdWmj+niV@kroah.com>
References: <20220909090856.18427-1-namcaov@gmail.com>
 <YxsUEUqbKRW85Z24@kroah.com>
 <CA+sZ8B_XzDO8pgFJLMzObBMo6KYHeYsttfYNoSUi+CGf8293xA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+sZ8B_XzDO8pgFJLMzObBMo6KYHeYsttfYNoSUi+CGf8293xA@mail.gmail.com>

On Fri, Sep 09, 2022 at 01:29:44PM +0200, Nam Cao wrote:
> On Fri, Sep 9, 2022 at 12:23 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > Why do you have to cast this to (void *)?  That should almost never be
> > needed.
> 
> Because I want to suppress a compiler warning:
> drivers/staging/vt6655/device_main.c:869:9: warning: passing argument
> 1 of ‘memset’ discards ‘volatile’ qualifier from pointer target type
> [-Wdiscarded-qualifiers]
>   869 |  memset(&rd->rd0, 0, sizeof(rd->rd0));
>       |         ^~~~~~~~

Why would that have a type of "volatile"?  That should be fixed first
please.

thanks,

greg k-h
