Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8033F8565D
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711637590; cv=none; b=AjDIl5rIaKcmedS0R0cPwu1B3VRNirEUXl+mP95Agm237J3biRt6X/7VQWSpqQ1fn7/BqdNvFx3o03ASTk4CF/d7z5QJHkbSx1kFKLehBA4hKqmhH+N+suUI/tiYenI1jF7IZknl+rTnv42aAUOcZfUpjSB/YwrxZSSwOs9TuJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711637590; c=relaxed/simple;
	bh=DpDdJuj+yKRdCtUb6m4f9tKpvq7tE5/yjekkRzqED+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgMbSi/n9FSK41qCjd6fb2G7iQOnO7dyt3z9SkmFlY3aOM7cPgvwl8wCLiUNlujDkT8YSMEzmwXQC8K/5OZtk3D5eN0fqywvIqCsSqz+6mBvGjdKaVbCbPAp2GDgcqM9kgcxdPJKXxaCHg7W7HlaX+dPiwSmvX2X2c13+GY3A3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnU1emu0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnU1emu0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7F8C433C7;
	Thu, 28 Mar 2024 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711637590;
	bh=DpDdJuj+yKRdCtUb6m4f9tKpvq7tE5/yjekkRzqED+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnU1emu0oCl1k3tt1eBW1TkvfKbAG1W1vawDM4GRyQjEOUop50gnj2OL/FDK07ARb
	 gnhrnadQvZUSfGbVBYsULrCqpev68e70qkXtkWlY+4dkhIvn/LYlhyvFKaSdDkEQVH
	 UkUkQGJWvQCOcHjqnY04fMkHHbG5c0oeP2D5Mhgc18zTU0wuGaYhxwyKl2NVluVNKd
	 87KrhFVwQYX+Jq7tnKCDw+e2MZD0gKgDJrBpEeGsB3M1Qrlbjj1PZ+TwxSfdo3NS19
	 qEB1nNpFtaoWuwaExpnPydMoTNN8lbAUmX2XVIvPwePfjIG09ZQ17wTj3u+HVbd40a
	 5mruLIuqq4zcA==
Date: Thu, 28 Mar 2024 14:53:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 5/5] staging: vc04_services: vchiq_core: Stop kthreads
 on shutdown
Message-ID: <80c720d9-8a9b-42c9-b5fa-fe8a33da7945@sirena.org.uk>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
 <20240321130737.898154-6-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OTUlPiEta4fbU8Xy"
Content-Disposition: inline
In-Reply-To: <20240321130737.898154-6-umang.jain@ideasonboard.com>
X-Cookie: Driver does not carry cash.


--OTUlPiEta4fbU8Xy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 06:37:37PM +0530, Umang Jain wrote:
> The various kthreads thread functions (slot_handler_func, sync_func,
> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
> vchiq_arm should be stopped on vchiq_shutdown().
>=20
> This also address the following TODO item:
>  * Fix kernel module support
>=20
> hence drop it from the TODO item list.

This has landed in -next as d9c60badccc183eb971e0941bb86f9475d4b9551
and appears to be causing substantial issues on the original Raspberry
Pi.  I'm seeing a lot of failed boots and one that worked is showing a
bunch of faults the first of which is:

[   18.010575] bcm2835_vchiq 2000b840.mailbox: sync: error: 0: sf unexpecte=
d msgid 0@3776f2e5,0
[   18.027151] ------------[ cut here ]------------
Setting prompt string to ['-+\\[ end trace \\w* \\]-+[^\\n]*\\r', '/ #', 'L=
ogin timed out', 'Login incorrect']
[   18.035622] WARNING: CPU: 0 PID: 97 at lib/refcount.c:25 kthread_stop+0x=
60/0xc4
[   18.046703] refcount_t: addition on 0; use-after-free.
[   18.055566] Modules linked in: bcm2835_v4l2(C+) videobuf2_vmalloc videob=
uf2_memops bcm2835_mmal_vchiq(C) videobuf2_v4l2 videobuf2_common snd_bcm283=
5(C) raspberrypi_hwmon bcm2835_rng rng_core vchiq(C)
[   18.084302] CPU: 0 PID: 97 Comm: vchiq-keep/0 Tainted: G         C      =
   6.9.0-rc1-next-20240328 #1
[   18.100553] Hardware name: BCM2835
[   18.107531] Call trace:=20
[   18.107582]  unwind_backtrace from show_stack+0x18/0x1c
[   18.122480]  show_stack from dump_stack_lvl+0x38/0x48
[   18.131126]  dump_stack_lvl from __warn+0x88/0xec
[   18.139507]  __warn from warn_slowpath_fmt+0x80/0xbc
[   18.148071]  warn_slowpath_fmt from kthread_stop+0x60/0xc4
[   18.157210]  kthread_stop from vchiq_shutdown_internal+0x48/0x94 [vchiq]
[   18.167974]  vchiq_shutdown_internal [vchiq] from vchiq_shutdown+0x38/0x=
98 [vchiq]
[   18.179664]  vchiq_shutdown [vchiq] from vchiq_keepalive_thread_func+0xb=
8/0x258 [vchiq]
[   18.191793]  vchiq_keepalive_thread_func [vchiq] from kthread+0xc4/0xd0
[   18.202482]  kthread from ret_from_fork+0x14/0x28
[   18.210834] Exception stack(0xdc8a9fb0 to 0xdc8a9ff8)
[   18.219579] 9fa0:                                     00000000 00000000 =
00000000 00000000
[   18.234691] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   18.249717] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   18.260498] ---[ end trace 0000000000000000 ]---

A bisect landed on this commit which does look plausibe, a bisect log is
below (note that due to the way my CI runs this isn't actually the
bisect running, it's what happens when you feed the results from a
bisect into bisect on a separate machine but it does show the commits):

# bad: [a6bd6c9333397f5a0e2667d4d82fef8c970108f2] Add linux-next specific f=
iles for 20240328
# good: [1f6fc07c0c4d1e30d2bae9962205a2e74f6b00b2] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [846ad4e37aa837616354d335187c3e79b20e2f1b] Merge branch 'togreg' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
# good: [08515f60ff706253d5f195f9983f6ec21fef7256] Merge branch 'for-linux-=
next' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [bbac19c294ebd1e2e55d5bc1130f6751a41c0d23] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
# good: [d5449432f794e75cd4f5e46bc33bfe6ce20b657d] spi: pxa2xx: Switch to u=
se dev_err_probe()
# good: [7b95ee0db7e0a7f99077f1b926323c7bf0d2e8f8] ASoC: soc-jack: Get rid =
of legacy GPIO support
# good: [59ffeb15b2f7b44cf934fd778dc0d98a35aa6a84] ASoC: Intel: sof_sdw: Ad=
d support for cs42l43 optional speaker output
# good: [4ed0915f5bc4bcc81bca783a5b984f3d81e9764e] ASoC: codecs: Add RK3308=
 internal audio codec driver
# good: [ea5fee227ff3dae209062ac9544906debe1e9ac1] ASoC: hdac_hda: improve =
error logs
# good: [1e90a846493c716e3e6b4d901fc0844e9eea6430] ASoC: soc-dai: Note vali=
d values of sysclock direction
# good: [61cafaeab5bca2d3e6a68ee8fa92b5c10b8610ca] ASoC: Intel: sof_rt5682:=
 board id cleanup for cml boards
# good: [9b163e0d330debbf7dcc14b2c3e2dc19a3b50a1d] spi: remove struct spi_m=
essage::is_dma_mapped
# good: [b340f56a74b62d8ce8617650c8ab4a26c87ba5c5] ASoC: dt-bindings: wm897=
4: Convert to dtschema
# good: [bf1894900b53f9047eb9b96c89717a9a22329f6a] staging: vc04_services: =
Implement vchiq_bus .remove
# good: [f119f9e050940070c3da3a7476b1bf7a63c803c4] staging: rtl8712: rename=
 tmpVal to avg_val
# good: [57c0b41bbe7b43c519f5824a964a406d1e7f60a3] staging: vc04_services: =
vchiq_arm: Use appropriate dev_* log helpers
# good: [bdeef5dcea6b164f4bd614655821b1ef12ebec9a] spi: rspi: Get rid of un=
used struct rspi_plat_data
# good: [885dd75f41f9fff5b277bc6ab28ad798f98a37b4] ASoC: dt-bindings: fsl-e=
sai: Convert fsl,esai.txt to yaml
# good: [10402419f2d60890525f590b54d0eaec3de0d87a] spi: spi-mt65xx: Rename =
a variable in interrupt handler
# good: [9855f05e553637f05494cf47a3154cbf9a5cfc67] ASoC: fsl: imx-es8328: S=
witch to using gpiod API
# good: [5f39231888c63f0a7708abc86b51b847476379d8] ASoC: mediatek: Assign d=
ummy when codec not specified for a DAI link
# good: [5edeb7d312628961046eec9b26a7e72f44baf846] regulator: pca9450: add =
pca9451a support
# good: [c14445bdcb98feddf9afaeb05e6193cc1f8eec1a] ASoC: fsl: imx-rpmsg: Up=
date to correct DT node
# good: [cee28113db17f0de58df0eaea4e2756c404ee01f] ASoC: dmaengine_pcm: All=
ow passing component name via config
# good: [b5867a5c0d7a6bf36f59f3d472c7aed33ca4d02c] spi: pxa2xx: Use proper =
SSP header in soc/pxa/ssp.c
# good: [60c10c678b582d41532fefa12667d8adca75811b] ASoC: Intel: avs: i2s_te=
st: Remove redundant dapm routes
# good: [aad6b35290f52639d3601063d33d9621c0948a04] regmap: maple: Remove se=
cond semicolon
# good: [a39111b1cf0864b1782f30f9a1fa65260d057327] spi: xilinx: Make num_ch=
ipselect 8-bit in the struct xspi_platform_data
# good: [e6913c6ef83c80aa7569c9e08204542222fbf542] ASoC: codecs: ES8326: De=
lete unused REG_SUPPLY
# good: [ab470abe58c09b2fbe2c1478e67a904fd803e84f] regulator: rpi-panel-att=
iny: convert to use maple tree register cache
# good: [0c5f77f4eaef8ed9fe752d21f40ac471dd511cfc] dt-bindings: regulator: =
qcom,usb-vbus-regulator: Add PM7250B compatible
# good: [21fa98f4197bb3365dda1417708b318f403c13c1] ASoC: sun8i-codec: Imple=
ment jack and accessory detection
git bisect start 'a6bd6c9333397f5a0e2667d4d82fef8c970108f2' '1f6fc07c0c4d1e=
30d2bae9962205a2e74f6b00b2' '846ad4e37aa837616354d335187c3e79b20e2f1b' '085=
15f60ff706253d5f195f9983f6ec21fef7256' 'bbac19c294ebd1e2e55d5bc1130f6751a41=
c0d23' 'd5449432f794e75cd4f5e46bc33bfe6ce20b657d' '7b95ee0db7e0a7f99077f1b9=
26323c7bf0d2e8f8' '59ffeb15b2f7b44cf934fd778dc0d98a35aa6a84' '4ed0915f5bc4b=
cc81bca783a5b984f3d81e9764e' 'ea5fee227ff3dae209062ac9544906debe1e9ac1' '1e=
90a846493c716e3e6b4d901fc0844e9eea6430' '61cafaeab5bca2d3e6a68ee8fa92b5c10b=
8610ca' '9b163e0d330debbf7dcc14b2c3e2dc19a3b50a1d' 'b340f56a74b62d8ce861765=
0c8ab4a26c87ba5c5' 'bf1894900b53f9047eb9b96c89717a9a22329f6a' 'f119f9e05094=
0070c3da3a7476b1bf7a63c803c4' '57c0b41bbe7b43c519f5824a964a406d1e7f60a3' 'b=
deef5dcea6b164f4bd614655821b1ef12ebec9a' '885dd75f41f9fff5b277bc6ab28ad798f=
98a37b4' '10402419f2d60890525f590b54d0eaec3de0d87a' '9855f05e553637f05494cf=
47a3154cbf9a5cfc67' '5f39231888c63f0a7708abc86b51b847476379d8' '5edeb7d3126=
28961046eec9b26a7e72f44baf846' 'c14445bdcb98feddf9afaeb05e6193cc1f8eec1a' '=
cee28113db17f0de58df0eaea4e2756c404ee01f' 'b5867a5c0d7a6bf36f59f3d472c7aed3=
3ca4d02c' '60c10c678b582d41532fefa12667d8adca75811b' 'aad6b35290f52639d3601=
063d33d9621c0948a04' 'a39111b1cf0864b1782f30f9a1fa65260d057327' 'e6913c6ef8=
3c80aa7569c9e08204542222fbf542' 'ab470abe58c09b2fbe2c1478e67a904fd803e84f' =
'0c5f77f4eaef8ed9fe752d21f40ac471dd511cfc' '21fa98f4197bb3365dda1417708b318=
f403c13c1'
# bad: [a6bd6c9333397f5a0e2667d4d82fef8c970108f2] Add linux-next specific f=
iles for 20240328
git bisect bad a6bd6c9333397f5a0e2667d4d82fef8c970108f2
# bad: [86c322a4c2ba300ebd086f8f70cec07bb9ca7fce] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
git bisect bad 86c322a4c2ba300ebd086f8f70cec07bb9ca7fce
# bad: [acb95230d1324d9cc8de9bca38664b607e57fbe3] Merge branch 'counter-nex=
t' of git://git.kernel.org/pub/scm/linux/kernel/git/wbg/counter.git
git bisect bad acb95230d1324d9cc8de9bca38664b607e57fbe3
# bad: [20952655235dd9b1447829591774f1d8561f7c6a] staging: wlan-ng: Remove =
broken driver prism2_usb
git bisect bad 20952655235dd9b1447829591774f1d8561f7c6a
# bad: [a1ba19a1ae7cd1e324685ded4ab563e78fe68648] greybus: lights: check re=
turn of get_channel_from_mode
git bisect bad a1ba19a1ae7cd1e324685ded4ab563e78fe68648
# bad: [d9c60badccc183eb971e0941bb86f9475d4b9551] staging: vc04_services: v=
chiq_core: Stop kthreads on shutdown
git bisect bad d9c60badccc183eb971e0941bb86f9475d4b9551
# first bad commit: [d9c60badccc183eb971e0941bb86f9475d4b9551] staging: vc0=
4_services: vchiq_core: Stop kthreads on shutdown
# bad: [d9c60badccc183eb971e0941bb86f9475d4b9551] staging: vc04_services: v=
chiq_core: Stop kthreads on shutdown
git bisect bad d9c60badccc183eb971e0941bb86f9475d4b9551
# first bad commit: [d9c60badccc183eb971e0941bb86f9475d4b9551] staging: vc0=
4_services: vchiq_core: Stop kthreads on shutdown

--OTUlPiEta4fbU8Xy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYFhE0ACgkQJNaLcl1U
h9AsUQf7BqJsxKTsZy9kPv+Zkt8+IeHaxNeQsyJfSEHn4a2U0KV5nUHnf4O8Q39W
t2P8CkPjp6xzK/hHWbKbYBPFIcZfOzUD9/zr2E41HiOaVmNna6lYFHKX+96q0mkq
ZZu4L1Ge7+KIa87gYcrjvkZ6k9Iqv3TMk4scFUDcn2bksh86x1MY7nvY8uLBWfYz
M7fO6OB4REf5WzpKWcgNbBb2cRbghwtD3LLpP0X8GbkE97zH0pLRdpvOB/5Big/r
RvfK7/DcHmrJjKPxYMSR0HVBeOk9fG7ACb0VM9jPx9Fuv+kh8CgNtO9wpiCME2ed
DyGox+kZepfoEplbB7DMhurLEQELlQ==
=u4lm
-----END PGP SIGNATURE-----

--OTUlPiEta4fbU8Xy--
