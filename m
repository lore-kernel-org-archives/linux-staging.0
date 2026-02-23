Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD5F35BDA7
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843421; cv=none; b=GuUYqH+W1zBCO2fQTqQXZ9eJ3cjPxhIl0UQF80cdPqY8zvUK5r0GbAGDc8tOZ9lyq2imzmElrgo45dLe/Kvx8xnpdQDxKfphM5C8TL4PY4+zd0d1gSAJpLDkeOSf7ZjTR+v+2WDju0gqkSJOLKFc3kJsJX0YavxkUFheC8SKMk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843421; c=relaxed/simple;
	bh=tJm65gDVnY5XofqUMLvunqtX4JnTVrofkVmuFJIPq+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8tSERmEu1NbUYUUgNWn/krSw/26sqFS2v7u/IIYwV1TCvPtTZXvIt4cmySkcNAI40wYp4Yhokv9d/xQcXSsXdkpyVPCjDQHeAPVFQubHC0thjjI+8gxo3txYYNGMhdCLI5uCtochyIH3YUvSVq0QnnF3RWud1p//X1UTCLMaCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=K8+uK/rY; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="K8+uK/rY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771843412; bh=tJm65gDVnY5XofqUMLvunqtX4JnTVrofkVmuFJIPq+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8+uK/rYSR7rJTePhWb7v3Iudvl3JZxc4na/rsEdUIBn6aF7Pw1moLZwEjhcNZeIm
	 9r/EEq0O657jU322jGbnVRzmFlQPXOma7+HLXnYKCxJ+HwBK1reZ1x5n56//uyba+n
	 CZT7xv9GXRj5m8DU+nyQu16j1Rv6RVTkGcCYBl3U0IcKwc/PQPHiXUgbKFPDQGy7Ob
	 O/FCBb+0+4+hooKKpU8w8lK8NDJeNlHhiMQANu1jkaCZM4ob3/jx7rBhSKPH1Hg6W5
	 ZJOcUkeeMa3U91qV0mc3DGrNNHdgo9gXQaTCVbTJVijiI1dYWuip3vUIaPASqDZsO7
	 l0z5FSm03O30Q==
Received: from plaes.org (localhost [127.0.0.1])
	by mail.plaes.org (Postfix) with ESMTPSA id 1E96940425;
	Mon, 23 Feb 2026 10:43:32 +0000 (UTC)
Date: Mon, 23 Feb 2026 10:43:31 +0000
From: Priit Laes <plaes@plaes.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	=?iso-8859-1?Q?Rog=E9rio?= Fernandes Pereira <rfp2005@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] staging: stl8723bs: Use common round_up macro
Message-ID: <aZwvU_zJfySr422N@plaes.org>
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-2-plaes@plaes.org>
 <517df668-cc9d-4a9a-92cb-04aa80069a56@gmail.com>
 <aZv9K1It5Q-J5Iaw@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZv9K1It5Q-J5Iaw@stanley.mountain>

On Mon, Feb 23, 2026 at 10:09:31AM +0300, Dan Carpenter wrote:
> On Sat, Feb 21, 2026 at 03:41:27PM -0400, Vivek BalachandharTN wrote:
> > Subject has a typo. Please correct it.
> > 
> > How did you test this? The driver code appears largely AI-generated unless
> > it has been validated on actual hardware, such as Pine64 Wi-Fi module or
> > another board compatible with rtl8723bs considering these changes are not
> > just indentation based.
> > 
> 
> The patch doesn't introduce any bugs.
> 
> #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
> 
> This is the canonical way to implement a round up macro.  It's how
> roundup() is implemented in the kernel.
> 
> The patch uses round_up() instead which is a faster version but it only
> works for power of 2 rounds.  psdio->block_transfer_len is 512 so it's
> fine.  I probably would prefer to use roundup() for that even though
> round_up() works as well.
> 
> We maybe should create a static checker rule to warn about using
> round_up() for non-power of 2 values:
> 
> KTODO: create a Smatch rule to use roundup() instead of round_up()
>        for user supplied values, or non-power of 2.
> 

Firstly, thanks for the kind words, Dan.

It's kinda annoying how things have changed since the old days.
Apparently if someone now attempts to improve the low-hanging fruit, it gets
instantly accused of doing something awful...

Anyway, meanwhile I actually discovered some better versions of out-of-tree
drivers for rtl8732bs based on existing rtw888 driver [1], [2], therefore I
have no motivation left to fix up my "own brain slop".

And on more thing - whats the proper way to use get_maintainers.pl script
with `git send-email` when sending patch series? Apparently I used it wrongly
and managed to agitate lots of people in the process..

[1] https://github.com/jernejsk/linux-1/tree/8723b
[2] https://github.com/MocLG/rtw88-rtl8723bs

Päikest,
Priit
