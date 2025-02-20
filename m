Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA01BE251
	for <linux-staging@lists.linux.dev>; Thu, 20 Feb 2025 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740041735; cv=none; b=RULMi0Q47kpO79dmtuCBtlBesX5AZDt5OHLUdbSndEHg2eTZitwZdfrhmLjDnUX25uIl/0Ld0ezUgKclT59Qvz0wljoeek/paIkRkYYibJyaPuLqBtRSDURqOFjgYPM57J9kzmAO4h8t+/KIc2QB5bO5txyWd/LejOkKgfXB/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740041735; c=relaxed/simple;
	bh=SdNR4ClrBx/eeZAz7z2iazWjvr1avPuKNfaN72mYIGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nH/7XVkhokCaLICWJqLX0AQdSd+g+TAUMc6KEsMD+DZaSG9y3+eUBgTBzh6jtxqbIJnU5A78f/l+WDn7Zc20SgwNNQxrqyBz6/ELzUaqgKstPaw5/80laP51QVaicDJ03aa3Oagjmw2wwIPTGXxDovH5aztzA14OqZrRJ08ON50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElGidC+L; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElGidC+L"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so10333235e9.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Feb 2025 00:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740041732; x=1740646532; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vJy3bOqSsh0t+h28vp9n62Av8VDeBRdvNoL1U3ajQ+A=;
        b=ElGidC+LJdAB9pn6L+o6T27HZrtdbf1l4F4ou+KWotO/Jxx08pY3zSWNABPEJm306N
         OGxtDAFbwLIFwJ9uNVGARww4dzxgBcTfkaTMqBG8lJ5tXDdXAtBRAgBKI9cua4PbrXv6
         Hq77+CAWZSDmJcfsvYblwMDKPoKaFP5KEhSsV+pBlEcp1lT7KmJ6YlQWGAceplx5esfO
         KAxEI73SCcER1WtMF6ZgbZCsfulW25fsnUvSdq830IDWdKk98v9ZNT+NYbi2fcoOtngE
         jYBTsyEkPb2TT3FG7cX1lTxEokxonWzthUec4eoQ6WoyLSZLpYKYkzwXrS7cI6bIA4Zx
         jG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740041732; x=1740646532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJy3bOqSsh0t+h28vp9n62Av8VDeBRdvNoL1U3ajQ+A=;
        b=iX33T1W4onhNMFpNqql2aymlz2Dv+5qDJeO2HMCSBHb35Qnn0npU+Hbk+jp6rHiR6w
         idL5JTUJ+RNe7yGYHbjAbfY93i4DdghIo153RjF/dLfVF/bBATWE4nKj1la3F2H4oMTG
         zNMdScElSqSxIA0iomJ3a7wYSlfaBlENgL8eD/XpmpVPM14W6w0orFOS2FRgILyi0qZn
         w8Q7iaxz4P0qRC5i4kY0ncb1zs6udq5f0s4pS+0TGZ33VKM9tVbbdatZdsXCihveW8js
         9YaYdKpV0wsk2BYG1Hmc2+3YrpbOm0sTjgEQaJQ3zuqSVpHi0/VWyev28nB/6m7WeQz+
         8S/g==
X-Gm-Message-State: AOJu0YyGptYsricpRzrToKX7SVBZFLm46fD4N0r3z+/QM4p0+MKsUHun
	gDQFQ8emBTumRVjvzVwaTEy5BOvPumCMYZui/nbGSVJxdqXNInPmiLXbfg==
X-Gm-Gg: ASbGncuZ67RUJ5Z9k3CSWJrU7WiTpcziAnN/duLAkdikl/BOpSahqQkT+U8deRNpjAS
	Y0KgTcyndBV7oIHTD4acoFcg7I/aDagdct7m23QQ6BYQTRi9Ro8eQQVx2Vs7+qyn3q48ItnYwjY
	Rb1ZiS8VZhiUCtVZzPw5TMA8CzBLqVJ2nVMqR07Kk6nGFWfM4Nm/sx4r6xSbAxS9odTKEISa9eh
	8shpccoF6C5f4Z2g3FEw97hZjj6X2uZWG1RCkinUUN3jPTIajahiZcwSthrYTXxGd5c7DuK4fEB
	M59vlaR6toVTUjhOkSC58LzZyqNgzLY=
X-Google-Smtp-Source: AGHT+IFfnW0cyW8E119bHHz9+mtO1ESWRT3Yf6hjXrVMUeUMEiuamjADqrwKcqa55mog5vcRyrjChA==
X-Received: by 2002:a5d:5847:0:b0:38f:3e0a:ca6a with SMTP id ffacd0b85a97d-38f614991c2mr1920875f8f.2.1740041731399;
        Thu, 20 Feb 2025 00:55:31 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5c36sm20239545f8f.67.2025.02.20.00.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:55:30 -0800 (PST)
Date: Thu, 20 Feb 2025 09:55:28 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] staging: gpib: Console messaging cleanup
Message-ID: <Z7buAACkugsEOa13@egonzo>
References: <20250214114708.28947-1-dpenkler@gmail.com>
 <2025021923-leverage-endpoint-c06e@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021923-leverage-endpoint-c06e@gregkh>

On Wed, Feb 19, 2025 at 04:48:39PM +0100, Greg KH wrote:
> On Fri, Feb 14, 2025 at 12:46:51PM +0100, Dave Penkler wrote:
> > The GPIB drivers printed a lot of spurious console messages. This
> > was linked to the level of code maturity, often using console
> > messages for debug.
> > 
> > This patch set cleans up the console messaging in the spirit of Greg's
> > recommendation: "When drivers are successful, they should be quiet"
> > 
> > All pr_info's have been removed except for one which is in the module
> > init of the common core driver indicating that the GPIB subsystem is
> > initialized.
> > 
> > All dev_info's have been removed or changed to dev_dbg except for the
> > attach and probe messages in the agilent and ni usb drivers. This is
> > to facilitate the creation of config and udev scripts to ensure that a
> > particular usb device is systematically attached to the same gpib
> > device file.
> > 
> > All custom debug and tty logging has been removed or replaced with
> > dev_dbg.
> > 
> > Error messages where the user can figure out what went wrong with
> > errno have also been removed, particularly timeouts and interrupts
> > during reads and writes which can occur quite frequently uneccessarily
> > cluttering up the console log.
> > 
> > The patches are 1 per driver.
> 
> All but 4 of these applied, can you rebase and resend the remaining
> ones?
> 
> thanks,
> 
> greg k-h
Sure, thanks.
(Could only find 3 that were not applied, will send those)
-dave
