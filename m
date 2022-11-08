Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3148BE1
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667920385; bh=sejP4aBDdhMo3HG9Xhj2vvP0zlb9qbq1zHjDd4eRHUM=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=ZuiOdBdjtkEIP+oN7dr8IVxqYOpsonyeISX+DbXtTEo1QPmbjl5am5DM8za3qZ0YY
	 hwaGCcfhBAUEM4DKUfgUUCHhTIDXJ6Iw9CUsAipf/cfzP5aMAKLYAaDEnmnAuYnxB4
	 4crHcJX4yRfHt2doHIiidtWeZ+qN/DXubq635474=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Tue,  8 Nov 2022 16:13:05 +0100 (CET)
X-EA-Auth: OlqpyWd3qQcgdjOz9yJAVFrkj87A1WXK9JgBsKUSYg+jqfeXlddkMDsowDf2k8clG2dGPZ5qCVS6zAKNw6gfGH2vXDnrj/ry
Date: Tue, 8 Nov 2022 20:42:59 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: staging/wlan-ng query: convert to flexible array member
Message-ID: <Y2px+zOGjkpGh6qC@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

First, my apologies for the long email.
I am requesting guidance on how to approach resolving the zero element flexible
VLO struct implementation in this driver in file drivers/staging/waln-ng/hfa384x.f

The struct hfa384x_pdrec contains nested structs with zero element arrays.  These
zero element structs are part of a union 'data' inside the struct container. This
union 'data' is the last element of this container. Please see the code snip below:

<snip>

	1068 struct hfa384x_pdrec {
	   1         __le16 len;             /* in words */
	   2         __le16 code;
	   3         union pdr {
	   4                 struct hfa384x_pdr_pcb_partnum pcb_partnum;
	  11                 struct hfa384x_pdr_nicid nicid;
	  12                 struct hfa384x_pdr_refdac_measurements refdac_measurements;
	  13                 struct hfa384x_pdr_vgdac_measurements vgdac_measurements;
	  14                 struct hfa384x_pdr_level_comp_measurements level_compc_measurements;
	  15                 struct hfa384x_pdr_mac_address mac_address;
	  39         } data;
	  40 } __packed;

</snip>

The three structures in question are declared as follows in the same file:

<snip>
	962  struct hfa384x_pdr_refdac_measurements {
	   1         u16 value[0];
	   2 } __packed;
	   3
	   4 struct hfa384x_pdr_vgdac_measurements {
	   5         u16 value[0];
	   6 } __packed;
	   7
	   8 struct hfa384x_pdr_level_comp_measurements {
	   9         u16 value[0];
	  10 } __packed;
</snip>

As per the C99 specifications, the flexible array struct should have at least
one member other than the true flexible array member. So converting these from
[0] to [] is not feasible in the current form.

I did not find these struct variables being used for memory allocation in the
code directly. My find may be short since the implementation appears to get very
complex as I tried to get deeper.

Can you please suggest how should I approach correcting the zero element flex
array implementation here? Can these structs be removed if they are unused?

Thank you.
./drv



