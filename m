Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD492D4B66
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 05:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767504327; cv=none; b=q6mqSx00TMS9IeCnjpj8u87Yz8DFy/aUWvescYtOyW+z9AfXZfsxCYnCzkpH22TexVows3aw5Butfxb2JqrZv7P51pKrLQkNLogMZiPkmWJIA/BaBj8qyTA5O6CoXizjXJYNmQOop1I1TrgB+G3EVh4oMSEpsWgjJJc7o8/50+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767504327; c=relaxed/simple;
	bh=I3WCzlV2edorTmg3PJ7toRE7SlA6LWsaLpA8+ZFEhQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5ip/4QOPKJihmWiXOx2yTgz0VAQauoSMpz/vfnNcTr2nXJoDlX04EOzdXRMjasqk1WYZqjHn5jwcbSdXiysFOWlEj5OAH6NhEnUCaHp/Ifm7XHOPoGuGVeBXI1RMF3hqWzngRXphElChgMF4TeZthBOIkONzO1h99DhLd3CwEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4PTfnnT; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4PTfnnT"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so10308848a12.0
        for <linux-staging@lists.linux.dev>; Sat, 03 Jan 2026 21:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767504325; x=1768109125; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQEr16uxByFpZ6dsm0QP3DXZzS+3qaAEyzf1bKeZK5E=;
        b=Y4PTfnnTxWLJ+JNTt3WF5XgDfeIuUnezY5E1LBP3hXlr17CyZ6lc2O3vGjMtGwjFyO
         TfJ2oPTrrTvRfL9n90vfR4VRDhnV7meCPq+tlKSyLbua81qx1KkvIuwTp8T4RnWnW6D2
         SiLmXcm6jwvYVXiJGa/oVR2S2PX4uyLFYsPZbkS+2rqMFNwCaxhBKSWWg8Hy8VLrbOI8
         IOsh3fKRnT8mTyZoxH7JBeRszekisR1UXLeMBVpMAl7y5dEQq7Uof7gC1LDLxzpVODmf
         MWvSW858BV5cESHucHVr+YY5MMpWxwJihvPDGdPY0Akt7bHSOKKgRFMVmUE7K/avRpTH
         i/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767504325; x=1768109125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQEr16uxByFpZ6dsm0QP3DXZzS+3qaAEyzf1bKeZK5E=;
        b=dYThHwiR4fi9+sHD7NqbLVkykogZCgnkbRUruHKhnRJ46FMs4TUoGpRFVkb4C0qjJG
         i1ea+yFuMKmmBeyz02cB/nm/jy7UlEsAq+m0RhrjUzKwyRX3JxSOSsvZb/S6MjB5Ak1Q
         oyNEFG3DQ/UCF1yfIybVl0g0AppbdyVwQ2vljbTm/mdCuEq2DJVOmQL/LAJx4+1Z4nWR
         nji8lvoXXAaHifVEfmlGXEZvdrokmELD+gcBZC35CDZXG4P5SQpokqfu2w2j2uhbqXEM
         Im0UNhQRUDoNN6s77Neuky1qrP58W/XH1wnpkLHDE3wthhPd6hKrqIBD7Ob6TGofKXY0
         24wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyFDQXp9f1GK7qPYtq82xsoPpJ9uet76zpxefRKdut4AgCd4A35FA550vFdqomJ6deIPMa1Imu6yf3Pa5e@lists.linux.dev
X-Gm-Message-State: AOJu0Yx22N0qHsUo7gbsmMYEc6C4AxhuOp48fc/GDOcDUE5F4BSK5Jrg
	NwlLM0NPzc5aWCm5x5wallYlS+2ZB+DJp+sflrtr2ZAl4IDyCvSZcUkO
X-Gm-Gg: AY/fxX6GgZUeU5XykK9cpFQ+GcYq7L8KMzVbGafJ3YXmj7NLlImvMKGb7D/39E+2AXt
	1cqnIXgAv2h5oZTVO3D9fXtnl78OG3HaPRox7EIIMc/LVYhfj6u4/UN09mS0JsQqSGMWT0dBB6/
	1iC4cXgurkeHaP9otPFMQp6lQXQZMcc1xk3VczUEDQuLJHzz403r+yinzSuMHdcCxsxaWbRrTFC
	PjxQYVZGp2lhzOzmKSMcViGJsBTnlTLjnBz5+0uo0W/cIz/01Y5pG/Hu5yyZznkKErjVDBm7HHN
	M2l5Mw/5swoKcHITY2RVTI9WXhdWgzCXpiEhKWpVsKrCoT+MDRLue/UESTD9vmG8gFCgSUdI8F1
	tue/qcUXO0j/bf9MmSQhfwjQvfa2+U0XhmOITEW/1smMKgQ34mCX0E7MQISi9jvWbYCZXqoB7l/
	QKF0BBmI5T9bf01+Xc7ISr6BcjbG218xQwU9K2WI4nuU1n8XgRULrqs2BxOgwwI+3v2gePP4XKr
	5sJRWKWI7P8WG0etw8FgHHdiGKHtsoJ+BvHIsCeNrCq1+72IiQejkqubHc=
X-Google-Smtp-Source: AGHT+IGv88ZyKsdGGf/yXvuvui+FMzWsvVI3MeuxnLqxqPfBAUWpeCfAt+yWc6QsN/FnF7dCNxMOnw==
X-Received: by 2002:a05:7301:815:b0:2b0:4902:c189 with SMTP id 5a478bee46e88-2b05ecab250mr28973064eec.33.1767504324670;
        Sat, 03 Jan 2026 21:25:24 -0800 (PST)
Received: from localhost ([181.191.143.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm97642003eec.0.2026.01.03.21.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 21:25:24 -0800 (PST)
Date: Sun, 4 Jan 2026 02:25:23 -0300
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 4/6] staging: iio: ad9832: remove dds.h dependency
Message-ID: <hjspdsgz6ey7iaczw3qxn5qwlmpv7pnhxxmrzmfigygc33at2r@3gq2xps7idza>
References: <20251230203459.28935-1-tomasborquez13@gmail.com>
 <20251230203459.28935-5-tomasborquez13@gmail.com>
 <CAHp75VefAPs8C9gJdz-zTkS3cpExg5pwOTMreiUs-ikSgpygOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VefAPs8C9gJdz-zTkS3cpExg5pwOTMreiUs-ikSgpygOw@mail.gmail.com>

On Wed, Dec 31, 2025 at 12:46:28AM +0200, Andy Shevchenko wrote:
> On Tue, Dec 30, 2025 at 10:35 PM Tomas Borquez <tomasborquez13@gmail.com> wrote:
> >
> > Remove dependency on dds.h by converting custom macros to standard IIO
> > attribute declarations.
> 
> 
> > +static IIO_DEVICE_ATTR(out_altvoltage0_frequency0, 0200, NULL, ad9832_write, AD9832_FREQ0HM);
> > +static IIO_DEVICE_ATTR(out_altvoltage0_frequency1, 0200, NULL, ad9832_write, AD9832_FREQ1HM);
> 
> Any particular point in not using _WO() / _RO() variants of the
> IIO_DEVICE_ATTR_*() macros?
I was looking into this and saw that the definition for both _WO() and _RO() only takes _name and _addr:

#define IIO_DEVICE_ATTR_WO(_name, _addr) \
	struct iio_dev_attr iio_dev_attr_##_name = IIO_ATTR_WO(_name, _addr)

So if we use it for frequency0 for example, it assumes the store function
since we don't pass it:

static IIO_DEVICE_ATTR_WO(out_altvoltage0_frequency0, AD9832_FREQ0HM);

// Expands to
struct iio_dev_attr iio_dev_attr_out_altvoltage0_frequency0 = {
    .dev_attr = {
        . attr = {
          ...
          .store = out_altvoltage0_frequency0_store,
        }
    }
}

Meaning we would have to create a store for each one instead of using
just one write function

> -- 
> With Best Regards,
> Andy Shevchenko
