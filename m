Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D821D2560
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 13:26:25 +0000 (UTC)
Date: Mon, 30 Jan 2023 13:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675085182;
	bh=ptL42kkxlabkwB6ja2m2x9/4R6IOCc41SdJfgo/zr4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTlAkaqtUq9fYNH9hnK/XxoQR3ZGZD5BYnrj76N+NU9l/sbpSPHh6FXiR4bcJBG1L
	 MDnkq30tcdgNQ/GL1rIu0KlzJ/PqALKrvMIF2idkSKWrPm/SSVaxz52kUoCoEEZuo0
	 yKdXq7Hcjckys2QB4YIb26wFsLG4qhH7kLMX5adc=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	Mark Gross <markgross@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/9] HID: Constify lowlevel HID drivers
Message-ID: <20230130132620.3cmmq5ga3uebazwf@t-8ch.de>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
 <0937b9a5-0caa-2a73-33c4-82e6cab02ef0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0937b9a5-0caa-2a73-33c4-82e6cab02ef0@redhat.com>

Hi Hans,

On Mon, Jan 30, 2023 at 09:36:32AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/30/23 04:59, Thomas Weiﬂschuh wrote:
> > Since 52d225346904 ("HID: Make lowlevel driver structs const") the
> > lowlevel HID drivers are only exposed as const.
> > 
> > Take advantage of this to constify the underlying structures, too.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> 
> Thanks, series looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> I'll also pick up / merge patches 7 + 8 into pdx86/for-next
> sometime this week.

Please note that patch 7 depends on commit 52d225346904
("HID: Make lowlevel driver structs const") which is not yet in Linus'
tree, only in the HID tree (branch for-6.3/hid-core).

Maybe it's better to take it via the HID tree or I can resend when the
prerequisites are in Linus' tree.

> Regards,
> 
> Hans
> 
> 
> 
> > ---
> > Thomas Weiﬂschuh (9):
> >       HID: amd_sfh: Constify lowlevel HID driver
> >       HID: hyperv: Constify lowlevel HID driver
> >       HID: logitech-dj: Constify lowlevel HID driver
> >       HID: steam: Constify lowlevel HID driver
> >       HID: intel-ish-hid: Constify lowlevel HID driver
> >       HID: surface-hid: Constify lowlevel HID driver
> >       platform/x86: asus-tf103c-dock: Constify lowlevel HID driver
> >       platform/x86: asus-tf103c-dock: Constify toprow keymap
> >       staging: greybus: hid: Constify lowlevel HID driver
> > 
> >  drivers/hid/amd-sfh-hid/amd_sfh_hid.c      | 2 +-
> >  drivers/hid/hid-hyperv.c                   | 2 +-
> >  drivers/hid/hid-logitech-dj.c              | 4 ++--
> >  drivers/hid/hid-steam.c                    | 2 +-
> >  drivers/hid/intel-ish-hid/ishtp-hid.c      | 2 +-
> >  drivers/hid/surface-hid/surface_hid_core.c | 2 +-
> >  drivers/platform/x86/asus-tf103c-dock.c    | 4 ++--
> >  drivers/staging/greybus/hid.c              | 2 +-
> >  8 files changed, 10 insertions(+), 10 deletions(-)
> > ---
> > base-commit: e04955db6a7c3fc4a1e6978649b61a6f5f8028e3
> > change-id: 20230130-hid-const-ll-driver-fcfdd3af11b8
> > 
> > Best regards,
> 
