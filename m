Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076C033FC
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 15:42:12 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h16so11454049wrz.12
        for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 07:42:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUbT8GW2Xe7TYWK+SBC453IgVa+1sYQmDI5rwmFeFNw=;
        b=SDVB7xq3iLehPCZ45NnkHO82FQprNC9dHhOtiBBnoEP1cf+UpgsZa8hPxmZ+6yrXNe
         8PLZNUfuOpJo8W19i0m0roH/kfVROPQHmD5hzV+Wu2W++23MZ9p7A7PcHjUXaXUjBy+A
         fXzG6rfjRAmAZ8Uc0N/ZYxDli/K4s3C1UIlF9MQX3LYY4M9100VsJZZTi/3N6lqMDfws
         vA4NycWRcTzGcT2AQr/lHhSxE8WytfjTWOaXzQMgZzGK4L/RDLplFDAvVCJ75LqRjVrw
         4sVA4oUueA7T6SdwCb8KITpySs1pp2OnaQD5aIcTQofAcAOgCHqH0mYjG4NjvDONNrgh
         H7KQ==
X-Gm-Message-State: AO0yUKUFyNIXdC2VD9tR4l0PjIAgvtvIVGOHy/IZ03nC/XqgEzc7sdBG
	IsGnoJFPYAQpp0IdVm6IrzI=
X-Google-Smtp-Source: AK7set9bilzV+cycilUvhPXZZQ4RW9LvqXB3OMkaS0/xxipVSHC82hgRy+Gvk8bq1qBYOdHHuQZcdA==
X-Received: by 2002:a05:6000:609:b0:2bf:d14a:21dd with SMTP id bn9-20020a056000060900b002bfd14a21ddmr16045718wrb.29.1675093331155;
        Mon, 30 Jan 2023 07:42:11 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id a18-20020adffad2000000b002be53aa2260sm13482929wrs.117.2023.01.30.07.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:42:10 -0800 (PST)
Date: Mon, 30 Jan 2023 15:42:09 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/9] HID: hyperv: Constify lowlevel HID driver
Message-ID: <Y9flUYVZBWXwdZfk@liuwe-devbox-debian-v2>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
 <20230130-hid-const-ll-driver-v1-2-3fc282b3b1d0@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130-hid-const-ll-driver-v1-2-3fc282b3b1d0@weissschuh.net>

On Mon, Jan 30, 2023 at 03:59:38AM +0000, Thomas Weiﬂschuh wrote:
> Since commit 52d225346904 ("HID: Make lowlevel driver structs const")
> the lowlevel HID drivers are only exposed as const.
> 
> Take advantage of this to constify the underlying structure, too.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Acked-by: Wei Liu <wei.liu@kernel.org>
