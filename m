Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 12D1C30F87
	for <linux-staging@lists.linux.dev>; Fri,  8 Sep 2023 19:19:07 +0000 (UTC)
Received: (qmail 792929 invoked by uid 1000); 8 Sep 2023 15:12:26 -0400
Date: Fri, 8 Sep 2023 15:12:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Kalle Valo <kvalo@kernel.org>, quic_jjohnson@quicinc.com, nbd@nbd.name,
  lorenzo@kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com,
  kuba@kernel.org, srini.raju@purelifi.com, stf_xl@wp.pl,
  helmut.schaa@googlemail.com, pkshih@realtek.com, corentin.chary@gmail.com,
  hdegoede@redhat.com, markgross@kernel.org, johannes.berg@intel.com,
  alexander@wetzel-home.de, error27@gmail.com, szymon.heidrich@gmail.com,
  gustavoars@kernel.org, lynxis@fe80.eu, daniel@makrotopia.org, arnd@arndb.de,
  shayne.chen@mediatek.com, keescook@chromium.org, tglx@linutronix.de,
  pabeni@redhat.com, rostedt@goodmis.org, jacob.e.keller@intel.com,
  ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
  ath11k@lists.infradead.org, ath12k@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
  acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
  linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.5 43/45] Fix nomenclature for USB and PCI
 wireless devices
Message-ID: <0d2ddf90-2334-4d0c-9f63-018c150e06a9@rowland.harvard.edu>
References: <20230908181327.3459042-1-sashal@kernel.org>
 <20230908181327.3459042-43-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908181327.3459042-43-sashal@kernel.org>

On Fri, Sep 08, 2023 at 02:13:24PM -0400, Sasha Levin wrote:
> From: Alan Stern <stern@rowland.harvard.edu>
> 
> [ Upstream commit 5d7cf67f72ae34d38e090bdfa673da4aefe4048e ]
> 
> A mouse that uses a USB connection is called a "USB mouse" device (or
> "USB mouse" for short), not a "mouse USB" device.  By analogy, a WiFi
> adapter that connects to the host computer via USB is a "USB wireless"
> device, not a "wireless USB" device.  (The latter term more properly
> refers to a defunct Wireless USB specification, which described a
> technology for sending USB protocol messages over an ultra wideband
> radio link.)
> 
> Similarly for a WiFi adapter card that plugs into a PCIe slot: It is a
> "PCIe wireless" device, not a "wireless PCIe" device.
> 
> Rephrase the text in the kernel source where the word ordering is
> wrong.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Kalle Valo <kvalo@kernel.org>
> Link: https://lore.kernel.org/r/57da7c80-0e48-41b5-8427-884a02648f55@rowland.harvard.edu
> Signed-off-by: Sasha Levin <sashal@kernel.org>


Is there any real reason to apply this commit to the -stable kernels?
I did not mark it that way when it was submitted, and it doesn't fix
any bugs.  In fact, aside from updating some module and device
description strings, all it does is change a bunch of comments.

Does that really fall under the -stable rules for acceptance?

Alan Stern
