Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796C1A4A
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 10:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A54C4339B;
	Tue, 31 Jan 2023 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675160161;
	bh=1pkJs2jkaOkE6Qmfs+EJL7dI3laoOBYaUoEx2DL2DAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeUCAMhotOYwRP97EU1HcJrCThrmOa5XN5RReHodKijjavC31Ovbrsqto0qcNy/Sl
	 y/QCoWqB7nj2mUGjSzyb63xaCRU5hUlSt1dKhEs6mo7Z2608k80HCl7mPZH6nhP499
	 SD1PuTM5tPeXyQziiqU+gvpWyRZEfhfoXMbXxawo=
Date: Tue, 31 Jan 2023 11:15:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
	Alex Elder <elder@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 9/9] staging: greybus: hid: Constify lowlevel HID driver
Message-ID: <Y9jqXklnj44XiZ93@kroah.com>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
 <20230130-hid-const-ll-driver-v1-9-3fc282b3b1d0@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130-hid-const-ll-driver-v1-9-3fc282b3b1d0@weissschuh.net>

On Mon, Jan 30, 2023 at 03:59:45AM +0000, Thomas Weiﬂschuh wrote:
> Since commit 52d225346904 ("HID: Make lowlevel driver structs const")
> the lowlevel HID drivers are only exposed as const.
> 
> Take advantage of this to constify the underlying structure, too.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
