Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415736;
	b=1h+NBQKjtvlnuuExYPN2DW6FIwep/BQ1wB2vPVjcj+p+I/FOjz9P085kJ7+y5+Zn7qo4
	 eukVcNE+PGh0ofOzM2vefB9Ci2AJoM9bhAT25kgIN55ir9fe94fa3eJ+168sBeXo5so1C
	 hCU5sZ+vcsvAqQKHcpjhqAwRjoCV5CP7YwcCkSlnvrxoz0N6D2qPJ9SLAIC44d4jcfiaZ
	 oALR3AbBBebA/wEsmG/eGzPKGMI+TmYlBABslDrXDaQxbNy9bWiCkbMGflNKTIhD+4Zzi
	 1T+f82+Lkn8V4va2AqaUyJzNfEPLA0h2HSYXgp705jTIy6HTW6alnNoPn/aF2sdHEuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415736;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hIh1oJXmPJn8/bufJnOWwv255cbPbO6RJV8+iEpFNQw=;
	b=evuB+7NIdyxbarOxgrRNvgS/V7I58JbF/RsC36UF3kyeYzEm4V2Tz/wMQ/fGsrTKyIIU
	 3OodctFjQfHnfLYwy1hLxMp5WQDkoL7WwkT6LuCeesrDNVbJeybv920IPyhdjBhoniAqf
	 RdXhUXov/NHn0BPb6quUbug7Xn+PslvZP1U3z5Ms3OkeZiPI0py3r1vJwVDJnS3iyqb6v
	 fNDdy0tV+UlIY/LMS/acvytFm5Fnkxlkhzh0hH0xKwlqJAl5ZHOtvj3yEj/MUzh42R6lw
	 gZVEmCEOeoai4n/ia0OtEwBkl8ZPNsfqv2Eq7l1hbXBsqa+8Ee1hnf4+dc6u6ZJ3WLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92933606A333
	for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 16:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92933606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e47347279so2185884f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 08:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415734; x=1795020534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hIh1oJXmPJn8/bufJnOWwv255cbPbO6RJV8+iEpFNQw=;
        b=adLrh2KvrsRnNf2euBgNuBjT1xIinImITV5YwCMyHO3T2l+ccRdvbzX4ykK2ewwBxj
         ql04cTSutkbEGPZ+TbRO8Spe/pqm4JKSjWAHHwZ92Ab5GGbsabzRrEONj8az4BzWiZq3
         /0w0ofkyP7ku+oWaq62GZRzortajfAEr5N7QIKolZZDKp1mZytleE6MXGlckoRCPajBE
         SoJGMm9mttLn8/15l4TL88LCO+PygZZ/h1VJ8dOT0YFmc8q3g3tDo/hKb8kXTpW0E9dp
         IsGkU1u2MbeaY1Wx8MTNObfTiJpW/TBJgXnUAnW8G3MIqukQYp4JTsqGj7GRhRVLmfB5
         qfYA==
X-Forwarded-Encrypted: i=1; AL+hErF7eARZTe9wxKx9qbBVEDPhgTQ7Ap/jdVsIHrkH7jQ7u5OEQHTOvKfeNAjF7Sfdl/z2DyY9pQfz2CaubbtA@lists.linux.dev
X-Gm-Message-State: APuU4Z80+HSG02Y/QpMWbxCcz9vEvj5Ywird9Z45F3zYpXy7eJgW2cn/
	vmZHd7qYlHNMoMAmT3VazYt8cftr/rz9c+GLYem0mghOXsK0MbmukszU
X-Gm-Gg: AYBFou3nAeFl2Rrd94V8OnxYPL13JZjweeGlXJnumqLcTIOyisBhjN6kMu5H7VtI3Ro
	dBmqgIssdEHxxFmL1BF3pFuvIEFOChPI1EJ6y1h+O9gGq1irG6d5Kxn4I/HnPxfdc5y4H/p/16S
	Iff3RpnM8/6KfZ1tGi5cVEUmaanYIDcU9DrAo0Y/VrNZF/z6BPBAyyn43K+4GGo3C6o5Nfkz5y8
	na1O72ryxbOfs55nErg4k7K+6luTMlMu5PPBNZVYdlwz13kdrhiaTbCuBL9KPRF9hQqwToTzRpt
	lgqzFNTe6g3L1qtQuacudVvO12O4S74jL5+ggDPyQOiawTJgO6j+lWUifHvUjHlTQSeVOjTk8jR
	yq7bdlbzIdyxf+kDO7Gn30WTC1t8CPGvz+Wg3Rd/qGgWge1VjjaeEd6OKteMs9QlfjAZbWUjCPu
	n4tafZXZeJPCq7B06v8o//oPenVa9QZPZhlYhpMI3Osqb9uCicSnhctcIw8uPp119kmqjp8Sf6q
	DqGhrwUyufVeAnhhDGd/V97G2NauXc4WxFl3hnUsRY1eQ7EoYeVvDneAVt0DJNpWFLUcM4QEvyE
	koh3u1lOYbKQyudGb0LzqS8XmstPgta7vepGm/XLNegwyWOStQDLNIHVT/f99FNZbiOOSQqx2Qa
	CM3MCKkdxudfUHff2xfT7YTvcx7iqOqY3p6hZrCZuhyHuKnQt4jASHzJs013q
X-Received: by 2002:a5d:588c:0:b0:499:53b3:39be with SMTP id ffacd0b85a97d-499c8d5bdfdmr5249070f8f.51.1794415733801;
        Wed, 11 Nov 2026 08:48:53 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm8244842f8f.32.2026.11.11.08.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:48:52 -0800 (PST)
Date: Wed, 11 Nov 2026 19:48:49 +0300
From: Dan Carpenter <dan@pereq.eu>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, error27@gmail.com,
	cenzhang@linux.microsoft.com, dennylin0707@gmail.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4] staging: fbtft: remove unused fbtft_init_dbg()
Message-ID: <avSccSGIsu1EbwnN@stanley.mountain>
References: <20261111163819.143147-1-himanshu.bakshi478@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111163819.143147-1-himanshu.bakshi478@gmail.com>

On Wed, Nov 11, 2026 at 10:08:19PM +0530, himanshu bakshi wrote:
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> 
> The fbtft_init_dbg() macro is not being used, so delete it.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> ---
> Changes in v4:
> - Add Reviewed-by from Andy Shevchenko.
> 

Collecting the tags is unnecessary.  Maintainers handle it.  You should
do it if you have to resend for a different reason but otherwise just
leave it.

regards,
dan carpenter

