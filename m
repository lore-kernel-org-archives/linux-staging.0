Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9D58835;
	Fri, 31 Mar 2023 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680280364; x=1711816364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tt4uXh3OL0SpPkF8UvSH0il5tiqkR9sHEYNqcC40lqg=;
  b=WMcF0ui58mxuYsM2q6OjQQwXOwv4T3fOIhUSP3BYdSeerujAztqT+g+Y
   IulA4shEZwD+ia6jJWC9rWxBZUebfnkgsIag05VX/erS1GTduK1kNfi+7
   3C0UAst7gSoqWRfhTHGSfVyYRL414WYRMwdsH9mCrMdpgJfWs8Ok4hodf
   +Y9ACwazV9egS4aQ4a3+xjwxG2+bGkloaRp7Rh2b5nFt0ybm5tA53kE01
   yAOHS9zIXFwwV5JuvVfVB0G2GNTiHnUK3jF9Ae7cjlRgAPsSGf/xVBErn
   Digaqe98eUuIzKrY01tUXhaSqrSgvkuGt/bOvur24PxpPB5lR1bHjqDNm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="341512315"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="341512315"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 09:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="931245849"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="931245849"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.209.63.54])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 09:32:42 -0700
Date: Fri, 31 Mar 2023 09:32:40 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Kloudifold <cloudifold.3125@gmail.com>, teddy.wang@siliconmotion.com,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <ZCcLKFgM15FY9U5S@aschofie-mobl2>
References: <ZBfro5U4s0lWA6tl@CloudiRingWorld>
 <ZBlov9bVs4pAJIlA@debian.me>
 <c561746c-6061-4c8e-8961-114a507d72e9@kili.mountain>
 <9c85a688-ef2c-4808-9aed-4acdefaed5f2@kili.mountain>
 <CAM44cXOB3kA03Ay6c5PO_eOkS7npa00A4mQnEj2ahubRPE+MDg@mail.gmail.com>
 <f56002cc-78a1-4972-b66a-b41f7bf124e1@kili.mountain>
 <CAM44cXOgi8pektFFF_sGWZED3LsiHkRPO3WP4skekNWJ+WY=KA@mail.gmail.com>
 <c8e69d93-48e3-4ff2-b684-115b3b501349@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8e69d93-48e3-4ff2-b684-115b3b501349@kili.mountain>

On Fri, Mar 31, 2023 at 07:32:35AM +0300, Dan Carpenter wrote:
> On Thu, Mar 30, 2023 at 02:27:15AM +0800, Kloudifold wrote:
> > On Mon, Mar 27, 2023, 6:10 PM Dan Carpenter <error27@gmail.com> wrote:
> > 
> > > On Mon, Mar 27, 2023 at 04:57:32PM +0800, Kloudifold wrote:
> > > > > So if you want your patches to get merged then work on high value stuff
> > > > > and we're much more flexible for that.
> > > >
> > > > Sorry, I find that I can't tell which are High Value patches except
> > > > for the security fix, and I can't find a high value patch to work.
> > > > Could you help tell me which are High Value patches?
> > >
> > > Please don't send private emails.
> > >
> > > The TODO says this driver is going to be replaced by
> > > https://gitlab.com/sudipm/sm750/tree/sm750
> > 
> > 
> > So I shouldn’t working on sm750, right?
> > If yes, what are high value patches in other drivers?

Dan,

Thank-you for all the suggestions and support you offer the
Outreachy applicants.


Kloudifold,

Despite the fact that the driver is on it's way 'out', GregKH may
have merged your patch, recognizing it as an Outreachy exercise,
if it was otherwise correct. 

In Outreachy, for the first patches, the goal is to get the patch
mechanisms correct. That's why we don't ask for high value patches
as your first, or second, or third.... patch. Once you have the
mechanism down, you progress to higher value patches.

For Outreachy applicants, that usually means a checkpatch format
cleanup, and then moving on to sparse, smatch, or other suggestions
from reviewers. The higher value items for Outreachy are often
something that caught a reviewers eye in your simple cleanup.

This smatch warning list from Dan is useful, however, none of the
warnings are from drivers/staging. Outreachy suggests sending
patches for drivers/staging.

Look for patch suggestions posted by Deepak, Julia, and I on the
Outreachy mailing list.

BTW - as Dan recently mentioned, patch reviewers often give conflicting
feedback. It's healthy conflict. We all want to improve the kernel, and
to help you improve as a kernel contributor. 

Welcome to the kernel community,
Alison

> 
> If you read the code enough you will find bugs.  But a shortcut to
> finding bugs is to use static analysis.
> 
> It has to be a new check which other people have not looked at.  For
> example, people have looked at kmalloc() leaks, but have they looked at
> mei_cl_vtag_alloc()?  I don't know, that's a random example of an alloc
> function.
> 
> I sent this list to the smatch email list yesterday.  It's a new
> warning which is looking places which return positive error codes
> instead of negatives.
> 
> Sometimes people use positive error codes deliberately, so you have to
> look at the caller and see how the error code is used.  In the commit
> message put that information like, "This error code gets returned to the
> user via the ioctl" or "This bug doesn't affect anything because the
> callers don't check for errors".
> 
> regards,
> dan carpenter

> arch/x86/hyperv/irqdomain.c:49 hv_map_interrupt() warn: was negative '-EINVAL' intended?
> drivers/connector/cn_proc.c:366 cn_proc_mcast_ctl() warn: was negative '-EPERM' intended?
> drivers/connector/cn_proc.c:379 cn_proc_mcast_ctl() warn: was negative '-EINVAL' intended?
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:4005 svm_ioctl() warn: was negative '-EINVAL' intended?
> drivers/infiniband/sw/rdmavt/mcast.c:180 rvt_mcast_add() warn: was negative '-EINVAL' intended?
> drivers/infiniband/sw/rdmavt/mcast.c:187 rvt_mcast_add() warn: was negative '-ESRCH' intended?
> drivers/infiniband/sw/rdmavt/mcast.c:193 rvt_mcast_add() warn: was negative '-ENOMEM' intended?
> drivers/infiniband/sw/rdmavt/mcast.c:200 rvt_mcast_add() warn: was negative '-EEXIST' intended?
> drivers/infiniband/sw/rdmavt/mcast.c:207 rvt_mcast_add() warn: was negative '-ENOMEM' intended?
> drivers/leds/leds-pwm.c:149 led_pwm_create_fwnode() warn: was negative '-EINVAL' intended?
> drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c:2133 chtls_abort_req_rss() warn: was negative '-ETIMEDOUT' intended?
> drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c:457 chtls_disconnect() warn: was negative '-ECONNRESET' intended?
> drivers/net/ethernet/mellanox/mlx4/fw.c:2752 mlx4_opreq_action() warn: was negative '-EPERM' intended?
> drivers/net/ethernet/mellanox/mlx4/fw.c:2780 mlx4_opreq_action() warn: was negative '-EINVAL' intended?
> drivers/phy/mediatek/phy-mtk-dp.c:172 mtk_dp_phy_probe() warn: was negative '-EINVAL' intended?
> drivers/scsi/aic7xxx/aic79xx_core.c:9939 ahd_read_seeprom() warn: was negative '-EINVAL' intended?
> drivers/scsi/aic7xxx/aic79xx_core.c:9982 ahd_write_seeprom() warn: was negative '-ENOENT' intended?
> drivers/scsi/aic7xxx/aic79xx_core.c:9995 ahd_write_seeprom() warn: was negative '-EINVAL' intended?
> drivers/scsi/aic7xxx/aic79xx_osm_pci.c:275 ahd_linux_pci_reserve_mem_region() warn: was negative '-ENOMEM' intended?
> drivers/scsi/aic7xxx/aic79xx_osm_pci.c:279 ahd_linux_pci_reserve_mem_region() warn: was negative '-ENOMEM' intended?
> drivers/scsi/aic7xxx/aic79xx_osm_pci.c:285 ahd_linux_pci_reserve_mem_region() warn: was negative '-ENOMEM' intended?
> drivers/scsi/aic7xxx/aic79xx_pci.c:420 ahd_pci_test_register_access() warn: was negative '-EIO' intended?
> drivers/scsi/aic7xxx/aic7xxx_osm.c:849 ahc_dmamem_alloc() warn: was negative '-ENOMEM' intended?
> drivers/scsi/aic7xxx/aic7xxx_osm_pci.c:349 ahc_linux_pci_reserve_mem_region() warn: was negative '-ENOMEM' intended?
> drivers/scsi/aic7xxx/aic7xxx_osm_pci.c:353 ahc_linux_pci_reserve_mem_region() warn: was negative '-ENOMEM' intended?
> drivers/scsi/aic7xxx/aic7xxx_osm_pci.c:358 ahc_linux_pci_reserve_mem_region() warn: was negative '-ENOMEM' intended?
> drivers/scsi/aic7xxx/aic7xxx_pci.c:1171 ahc_pci_test_register_access() warn: was negative '-EIO' intended?
> drivers/scsi/ch.c:808 ch_ioctl() warn: was negative '-EIO' intended?
> drivers/scsi/fnic/vnic_dev.c:253 vnic_dev_cmd1() warn: was negative '-EINVAL' intended?
> drivers/scsi/fnic/vnic_dev.c:254 vnic_dev_cmd1() warn: was negative '-EFAULT' intended?
> drivers/scsi/fnic/vnic_dev.c:255 vnic_dev_cmd1() warn: was negative '-EPERM' intended?
> drivers/scsi/fnic/vnic_dev.c:256 vnic_dev_cmd1() warn: was negative '-EBUSY' intended?
> drivers/scsi/iscsi_tcp.c:698 iscsi_sw_tcp_conn_stop() warn: was negative '-EIO' intended?
> drivers/scsi/qla2xxx/qla_iocb.c:3895 qla2x00_start_sp() warn: was negative '-EAGAIN' intended?
> drivers/scsi/sg.c:514 sg_read() warn: was negative '-EBUSY' intended?
> drivers/scsi/sg.c:521 sg_read() warn: was negative '-EIO' intended?
> drivers/scsi/sg.c:525 sg_read() warn: was negative '-EIO' intended?
> drivers/scsi/sg.c:528 sg_read() warn: was negative '-EIO' intended?
> drivers/usb/cdns3/cdns3-gadget.c:2525 __cdns3_gadget_ep_queue() warn: was negative '-EINPROGRESS' intended?
> drivers/usb/cdns3/cdns3-gadget.c:595 cdns3_wa2_gadget_ep_queue() warn: was negative '-EINPROGRESS' intended?
> drivers/usb/core/devio.c:2854 usbdev_remove() warn: was negative '-EPIPE' intended?
> drivers/usb/misc/usbtest.c:1262 test_ctrl_queue() warn: was negative '-EPIPE' intended?
> drivers/usb/misc/usbtest.c:1279 test_ctrl_queue() warn: was negative '-EPIPE' intended?
> drivers/usb/misc/usbtest.c:1301 test_ctrl_queue() warn: was negative '-EPIPE' intended?
> drivers/usb/misc/usbtest.c:1319 test_ctrl_queue() warn: was negative '-EPIPE' intended?
> drivers/usb/misc/usbtest.c:1327 test_ctrl_queue() warn: was negative '-EREMOTEIO' intended?
> drivers/vhost/vsock.c:706 vhost_vsock_reset_orphans() warn: was negative '-ECONNRESET' intended?
> drivers/xen/xenbus/xenbus_xs.c:162 get_error() warn: was negative '-EINVAL' intended?
> net/9p/error.c:225 p9_errstr2errno() warn: was negative '-ESERVERFAULT' intended?
> net/ax25/af_ax25.c:102 ax25_kill_by_device() warn: was negative '-ENETUNREACH' intended?
> net/ax25/af_ax25.c:403 ax25_ctl_ioctl() warn: was negative '-ENETRESET' intended?
> net/ax25/af_ax25.c:93 ax25_kill_by_device() warn: was negative '-ENETUNREACH' intended?
> net/ax25/ax25_ds_in.c:179 ax25_ds_state3_machine() warn: was negative '-ECONNRESET' intended?
> net/ax25/ax25_ds_in.c:83 ax25_ds_state1_machine() warn: was negative '-ECONNREFUSED' intended?
> net/ax25/ax25_ds_timer.c:149 ax25_ds_t3timer_expiry() warn: was negative '-ETIMEDOUT' intended?
> net/ax25/ax25_ds_timer.c:194 ax25_ds_t1_timeout() warn: was negative '-ETIMEDOUT' intended?
> net/ax25/ax25_ds_timer.c:215 ax25_ds_t1_timeout() warn: was negative '-ETIMEDOUT' intended?
> net/ax25/ax25_ds_timer.c:225 ax25_ds_t1_timeout() warn: was negative '-ETIMEDOUT' intended?
> net/ax25/ax25_ds_timer.c:84 ax25_ds_timeout() warn: was negative '-ETIMEDOUT' intended?
> net/ax25/ax25_out.c:332 ax25_transmit_buffer() warn: was negative '-ENETUNREACH' intended?
> net/ax25/ax25_std_in.c:173 ax25_std_state3_machine() warn: was negative '-ECONNRESET' intended?
> net/ax25/ax25_std_in.c:300 ax25_std_state4_machine() warn: was negative '-ECONNRESET' intended?
> net/ax25/ax25_std_in.c:83 ax25_std_state1_machine() warn: was negative '-ECONNREFUSED' intended?
> net/ax25/ax25_std_timer.c:126 ax25_std_t1timer_expiry() warn: was negative '-ETIMEDOUT' intended?
> net/ax25/ax25_std_timer.c:147 ax25_std_t1timer_expiry() warn: was negative '-ETIMEDOUT' intended?
> net/ax25/ax25_std_timer.c:164 ax25_std_t1timer_expiry() warn: was negative '-ETIMEDOUT' intended?
> net/ax25/ax25_subr.c:264 ax25_disconnect() warn: was negative '-ENETUNREACH' intended?
> net/bluetooth/6lowpan.c:1019 disconnect_all_peers() warn: was negative '-ENOENT' intended?
> net/bluetooth/6lowpan.c:916 bt_6lowpan_disconnect() warn: was negative '-ENOENT' intended?
> net/bluetooth/bnep/core.c:527 bnep_session() warn: was negative '-EUNATCH' intended?
> net/bluetooth/hci_request.c:919 hci_request_cancel_all() warn: was negative '-ENODEV' intended?
> net/bluetooth/hci_sock.c:778 hci_sock_dev_event() warn: was negative '-EPIPE' intended?
> net/bluetooth/hidp/core.c:419 hidp_idle_timeout() warn: was negative '-EUNATCH' intended?
> net/bluetooth/hidp/core.c:420 hidp_idle_timeout() warn: was negative '-EUNATCH' intended?
> net/bluetooth/iso.c:614 __iso_sock_close() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/iso.c:621 __iso_sock_close() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/iso.c:634 __iso_sock_close() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/iso.c:637 __iso_sock_close() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/iso.c:89 iso_sock_timeout() warn: was negative '-ETIMEDOUT' intended?
> net/bluetooth/l2cap_core.c:1655 l2cap_conn_start() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:1663 l2cap_conn_start() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:2202 l2cap_ertm_resend() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:3019 l2cap_tx_state_wait_f() warn: was negative '-ECONNABORTED' intended?
> net/bluetooth/l2cap_core.c:3980 l2cap_ecred_rsp_defer() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:4358 l2cap_connect_create_rsp() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:445 l2cap_chan_timeout() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:4465 l2cap_config_req() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:448 l2cap_chan_timeout() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:450 l2cap_chan_timeout() warn: was negative '-ETIMEDOUT' intended?
> net/bluetooth/l2cap_core.c:4561 l2cap_config_rsp() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:4583 l2cap_config_rsp() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:4592 l2cap_config_rsp() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:4606 l2cap_config_rsp() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:4609 l2cap_config_rsp() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:4672 l2cap_disconnect_req() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:5007 l2cap_logical_fail() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:5699 l2cap_le_connect_rsp() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:5714 l2cap_le_connect_rsp() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:5969 l2cap_le_credits() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:6186 l2cap_ecred_conn_rsp() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:6204 l2cap_ecred_conn_rsp() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:6208 l2cap_ecred_conn_rsp() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:6220 l2cap_ecred_conn_rsp() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:6235 l2cap_ecred_conn_rsp() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:6241 l2cap_ecred_conn_rsp() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:6355 l2cap_ecred_reconf_rsp() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:6378 l2cap_le_command_rej() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:6755 l2cap_handle_srej() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:6769 l2cap_handle_srej() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:6813 l2cap_handle_rej() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:6822 l2cap_handle_rej() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:7024 l2cap_rx_state_recv() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:7157 l2cap_rx_state_srej_sent() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:7352 l2cap_rx() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:7435 l2cap_data_rcv() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:7465 l2cap_data_rcv() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:7482 l2cap_data_rcv() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:7493 l2cap_data_rcv() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:7549 l2cap_ecred_data_rcv() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/l2cap_core.c:8312 l2cap_check_encryption() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/l2cap_core.c:8499 l2cap_recv_acldata() warn: was negative '-ECOMM' intended?
> net/bluetooth/l2cap_core.c:8524 l2cap_recv_acldata() warn: was negative '-ECOMM' intended?
> net/bluetooth/l2cap_core.c:8539 l2cap_recv_acldata() warn: was negative '-ECOMM' intended?
> net/bluetooth/l2cap_core.c:8546 l2cap_recv_acldata() warn: was negative '-ECOMM' intended?
> net/bluetooth/l2cap_core.c:8559 l2cap_recv_acldata() warn: was negative '-ECOMM' intended?
> net/bluetooth/l2cap_sock.c:1453 l2cap_sock_cleanup_listen() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/lib.c:100 bt_to_errno() warn: was negative '-EOPNOTSUPP' intended?
> net/bluetooth/lib.c:103 bt_to_errno() warn: was negative '-EINVAL' intended?
> net/bluetooth/lib.c:108 bt_to_errno() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/lib.c:111 bt_to_errno() warn: was negative '-ECONNABORTED' intended?
> net/bluetooth/lib.c:114 bt_to_errno() warn: was negative '-ELOOP' intended?
> net/bluetooth/lib.c:117 bt_to_errno() warn: was negative '-EACCES' intended?
> net/bluetooth/lib.c:120 bt_to_errno() warn: was negative '-EPROTONOSUPPORT' intended?
> net/bluetooth/lib.c:123 bt_to_errno() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/lib.c:130 bt_to_errno() warn: was negative '-EPROTO' intended?
> net/bluetooth/lib.c:133 bt_to_errno() warn: was negative '-ENOSYS' intended?
> net/bluetooth/lib.c:52 bt_to_errno() warn: was negative '-EBADRQC' intended?
> net/bluetooth/lib.c:55 bt_to_errno() warn: was negative '-ENOTCONN' intended?
> net/bluetooth/lib.c:58 bt_to_errno() warn: was negative '-EIO' intended?
> net/bluetooth/lib.c:62 bt_to_errno() warn: was negative '-EHOSTDOWN' intended?
> net/bluetooth/lib.c:65 bt_to_errno() warn: was negative '-EACCES' intended?
> net/bluetooth/lib.c:68 bt_to_errno() warn: was negative '-EBADE' intended?
> net/bluetooth/lib.c:71 bt_to_errno() warn: was negative '-ENOMEM' intended?
> net/bluetooth/lib.c:74 bt_to_errno() warn: was negative '-ETIMEDOUT' intended?
> net/bluetooth/lib.c:77 bt_to_errno() warn: was negative '-EMLINK' intended?
> net/bluetooth/lib.c:80 bt_to_errno() warn: was negative '-EMLINK' intended?
> net/bluetooth/lib.c:83 bt_to_errno() warn: was negative '-EALREADY' intended?
> net/bluetooth/lib.c:86 bt_to_errno() warn: was negative '-EBUSY' intended?
> net/bluetooth/lib.c:91 bt_to_errno() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/lib.c:94 bt_to_errno() warn: was negative '-ETIMEDOUT' intended?
> net/bluetooth/rfcomm/core.c:1249 rfcomm_recv_ua() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/rfcomm/core.c:1267 rfcomm_recv_dm() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/rfcomm/core.c:1269 rfcomm_recv_dm() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/rfcomm/core.c:1276 rfcomm_recv_dm() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/rfcomm/core.c:1278 rfcomm_recv_dm() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/rfcomm/core.c:1298 rfcomm_recv_disc() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/rfcomm/core.c:1300 rfcomm_recv_disc() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/rfcomm/core.c:1311 rfcomm_recv_disc() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/rfcomm/core.c:1313 rfcomm_recv_disc() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/rfcomm/core.c:1884 rfcomm_process_dlcs() warn: was negative '-ETIMEDOUT' intended?
> net/bluetooth/rfcomm/core.c:1889 rfcomm_process_dlcs() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/rfcomm/core.c:1917 rfcomm_process_dlcs() warn: was negative '-ECONNREFUSED' intended?
> net/bluetooth/sco.c:425 __sco_sock_close() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/sco.c:431 __sco_sock_close() warn: was negative '-ECONNRESET' intended?
> net/bluetooth/sco.c:98 sco_sock_timeout() warn: was negative '-ETIMEDOUT' intended?
> net/caif/caif_socket.c:225 caif_ctrl_cb() warn: was negative '-ECONNREFUSED' intended?
> net/caif/caif_socket.c:239 caif_ctrl_cb() warn: was negative '-ECONNRESET' intended?
> net/can/bcm.c:1439 bcm_notify() warn: was negative '-ENODEV' intended?
> net/can/bcm.c:1447 bcm_notify() warn: was negative '-ENETDOWN' intended?
> net/can/isotp.c:1309 isotp_bind() warn: was negative '-ENETDOWN' intended?
> net/can/isotp.c:1531 isotp_notify() warn: was negative '-ENODEV' intended?
> net/can/isotp.c:1537 isotp_notify() warn: was negative '-ENETDOWN' intended?
> net/can/isotp.c:193 isotp_rx_timer_handler() warn: was negative '-ETIMEDOUT' intended?
> net/can/isotp.c:367 isotp_rcv_fc() warn: was negative '-EBADMSG' intended?
> net/can/isotp.c:421 isotp_rcv_fc() warn: was negative '-EMSGSIZE' intended?
> net/can/isotp.c:449 isotp_rcv_sf() warn: was negative '-EBADMSG' intended?
> net/can/isotp.c:564 isotp_rcv_cf() warn: was negative '-EILSEQ' intended?
> net/can/isotp.c:588 isotp_rcv_cf() warn: was negative '-EBADMSG' intended?
> net/can/isotp.c:890 isotp_tx_timer_handler() warn: was negative '-ECOMM' intended?
> net/can/j1939/socket.c:1148 j1939_sk_send_loop() warn: was negative '-EBUSY' intended?
> net/can/j1939/socket.c:1267 j1939_sk_netdev_event_netdown() warn: was negative '-ENETDOWN' intended?
> net/can/j1939/socket.c:630 j1939_sk_release() warn: was negative '-ESHUTDOWN' intended?
> net/can/j1939/transport.c:181 j1939_xtp_abort_to_errno() warn: was negative '-EALREADY' intended?
> net/can/j1939/transport.c:184 j1939_xtp_abort_to_errno() warn: was negative '-EMSGSIZE' intended?
> net/can/j1939/transport.c:187 j1939_xtp_abort_to_errno() warn: was negative '-EHOSTUNREACH' intended?
> net/can/j1939/transport.c:190 j1939_xtp_abort_to_errno() warn: was negative '-EBADMSG' intended?
> net/can/j1939/transport.c:193 j1939_xtp_abort_to_errno() warn: was negative '-ENOTRECOVERABLE' intended?
> net/can/j1939/transport.c:196 j1939_xtp_abort_to_errno() warn: was negative '-ENOTCONN' intended?
> net/can/j1939/transport.c:199 j1939_xtp_abort_to_errno() warn: was negative '-EILSEQ' intended?
> net/can/j1939/transport.c:202 j1939_xtp_abort_to_errno() warn: was negative '-EPROTO' intended?
> net/can/j1939/transport.c:205 j1939_xtp_abort_to_errno() warn: was negative '-EPROTO' intended?
> net/can/j1939/transport.c:208 j1939_xtp_abort_to_errno() warn: was negative '-EPROTO' intended?
> net/can/j1939/transport.c:211 j1939_xtp_abort_to_errno() warn: was negative '-EPROTO' intended?
> net/can/j1939/transport.c:214 j1939_xtp_abort_to_errno() warn: was negative '-EPROTO' intended?
> net/can/j1939/transport.c:217 j1939_xtp_abort_to_errno() warn: was negative '-EPROTO' intended?
> net/can/j1939/transport.c:2190 j1939_cancel_active_session() warn: was negative '-ESHUTDOWN' intended?
> net/can/j1939/transport.c:220 j1939_xtp_abort_to_errno() warn: was negative '-EPROTO' intended?
> net/can/j1939/transport.c:223 j1939_xtp_abort_to_errno() warn: was negative '-EPROTO' intended?
> net/can/j1939/transport.c:226 j1939_xtp_abort_to_errno() warn: was negative '-EPROTO' intended?
> net/can/j1939/transport.c:230 j1939_xtp_abort_to_errno() warn: was negative '-EPROTO' intended?
> net/can/raw.c:298 raw_notify() warn: was negative '-ENODEV' intended?
> net/can/raw.c:304 raw_notify() warn: was negative '-ENETDOWN' intended?
> net/can/raw.c:492 raw_bind() warn: was negative '-ENETDOWN' intended?
> net/core/skmsg.c:686 sk_psock_backlog() warn: was negative '-EPIPE' intended?
> net/dccp/input.c:513 dccp_rcv_request_sent_state_process() warn: was negative '-ECOMM' intended?
> net/dccp/ipv4.c:311 dccp_v4_err() warn: was negative '-EPROTO' intended?
> net/dccp/ipv4.c:326 dccp_v4_err() warn: was negative '-EHOSTUNREACH' intended?
> net/dccp/proto.c:271 dccp_disconnect() warn: was negative '-ECONNRESET' intended?
> net/dccp/proto.c:273 dccp_disconnect() warn: was negative '-ECONNRESET' intended?
> net/dccp/timer.c:22 dccp_write_err() warn: was negative '-ETIMEDOUT' intended?
> net/ipv4/ip_output.c:1005 __ip_append_data() warn: was negative '-EMSGSIZE' intended?
> net/ipv4/ip_output.c:1388 ip_append_page() warn: was negative '-EMSGSIZE' intended?
> net/ipv4/ping.c:549 ping_err() warn: was negative '-EHOSTUNREACH' intended?
> net/ipv4/ping.c:555 ping_err() warn: was negative '-EREMOTEIO' intended?
> net/ipv4/ping.c:558 ping_err() warn: was negative '-EPROTO' intended?
> net/ipv4/ping.c:565 ping_err() warn: was negative '-EMSGSIZE' intended?
> net/ipv4/ping.c:571 ping_err() warn: was negative '-EHOSTUNREACH' intended?
> net/ipv4/ping.c:580 ping_err() warn: was negative '-EREMOTEIO' intended?
> net/ipv4/raw.c:228 raw_err() warn: was negative '-EHOSTUNREACH' intended?
> net/ipv4/raw.c:233 raw_err() warn: was negative '-EPROTO' intended?
> net/ipv4/raw.c:237 raw_err() warn: was negative '-EHOSTUNREACH' intended?
> net/ipv4/raw.c:242 raw_err() warn: was negative '-EMSGSIZE' intended?
> net/ipv4/raw.c:334 raw_send_hdrinc() warn: was negative '-EMSGSIZE' intended?
> net/ipv4/raw_diag.c:211 raw_diag_destroy() warn: was negative '-ECONNABORTED' intended?
> net/ipv4/tcp_diag.c:216 tcp_diag_destroy() warn: was negative '-ECONNABORTED' intended?
> net/ipv4/tcp_ipv4.c:548 tcp_v4_err() warn: was negative '-EPROTO' intended?
> net/ipv4/tcp_ipv4.c:581 tcp_v4_err() warn: was negative '-EHOSTUNREACH' intended?
> net/ipv4/udp.c:757 __udp4_lib_err() warn: was negative '-EHOSTUNREACH' intended?
> net/ipv4/udp.c:762 __udp4_lib_err() warn: was negative '-EPROTO' intended?
> net/ipv4/udp.c:769 __udp4_lib_err() warn: was negative '-EMSGSIZE' intended?
> net/ipv4/udp.c:775 __udp4_lib_err() warn: was negative '-EHOSTUNREACH' intended?
> net/ipv4/udp_diag.c:218 __udp_diag_destroy() warn: was negative '-ECONNABORTED' intended?
> net/ipv4/xfrm4_output.c:44 xfrm4_local_error() warn: was negative '-EMSGSIZE' intended?
> net/ipv6/icmp.c:1132 icmpv6_err_convert() warn: was negative '-EPROTO' intended?
> net/ipv6/icmp.c:1144 icmpv6_err_convert() warn: was negative '-EMSGSIZE' intended?
> net/ipv6/icmp.c:1148 icmpv6_err_convert() warn: was negative '-EPROTO' intended?
> net/ipv6/icmp.c:1153 icmpv6_err_convert() warn: was negative '-EHOSTUNREACH' intended?
> net/ipv6/ip6_output.c:1548 __ip6_append_data() warn: was negative '-EMSGSIZE' intended?
> net/ipv6/ip6_output.c:352 ip6_xmit() warn: was negative '-EMSGSIZE' intended?
> net/ipv6/raw.c:603 rawv6_send_hdrinc() warn: was negative '-EMSGSIZE' intended?
> net/ipv6/xfrm6_output.c:40 xfrm6_local_error() warn: was negative '-EMSGSIZE' intended?
> net/kcm/kcmsock.c:1531 kcm_unattach() warn: was negative '-EPIPE' intended?
> net/kcm/kcmsock.c:1845 kcm_release() warn: was negative '-EPIPE' intended?
> net/kcm/kcmsock.c:412 psock_state_change() warn: was negative '-EPIPE' intended?
> net/kcm/kcmsock.c:51 report_csk_error() warn: was negative '-EPIPE' intended?
> net/kcm/kcmsock.c:678 kcm_write_msgs() warn: was negative '-EPIPE' intended?
> net/netlink/af_netlink.c:1579 do_one_set_err() warn: was negative '-ENOBUFS' intended?
> net/netlink/af_netlink.c:2541 netlink_ack() warn: was negative '-ENOBUFS' intended?
> net/netlink/af_netlink.c:357 netlink_overrun() warn: was negative '-ENOBUFS' intended?
> net/netrom/af_netrom.c:108 nr_kill_by_device() warn: was negative '-ENETUNREACH' intended?
> net/netrom/nr_in.c:101 nr_state1_machine() warn: was negative '-ECONNRESET' intended?
> net/netrom/nr_in.c:120 nr_state2_machine() warn: was negative '-ECONNRESET' intended?
> net/netrom/nr_in.c:132 nr_state2_machine() warn: was negative '-ECONNRESET' intended?
> net/netrom/nr_in.c:169 nr_state3_machine() warn: was negative '-ECONNRESET' intended?
> net/netrom/nr_in.c:266 nr_state3_machine() warn: was negative '-ECONNRESET' intended?
> net/netrom/nr_in.c:96 nr_state1_machine() warn: was negative '-ECONNREFUSED' intended?
> net/netrom/nr_out.c:211 nr_transmit_buffer() warn: was negative '-ENETUNREACH' intended?
> net/netrom/nr_timer.c:215 nr_t1timer_expiry() warn: was negative '-ETIMEDOUT' intended?
> net/netrom/nr_timer.c:225 nr_t1timer_expiry() warn: was negative '-ETIMEDOUT' intended?
> net/netrom/nr_timer.c:235 nr_t1timer_expiry() warn: was negative '-ETIMEDOUT' intended?
> net/nfc/llcp_core.c:1216 nfc_llcp_recv_dm() warn: was negative '-ENXIO' intended?
> net/nfc/llcp_core.c:153 local_cleanup() warn: was negative '-ENXIO' intended?
> net/nfc/nci/core.c:556 nci_close_device() warn: was negative '-ENODEV' intended?
> net/packet/af_packet.c:3262 packet_do_bind() warn: was negative '-ENETDOWN' intended?
> net/packet/af_packet.c:4160 packet_notifier() warn: was negative '-ENETDOWN' intended?
> net/qrtr/af_qrtr.c:759 qrtr_reset_ports() warn: was negative '-ENETRESET' intended?
> net/rose/af_rose.c:172 rose_kill_by_neigh() warn: was negative '-ENETUNREACH' intended?
> net/rose/af_rose.c:192 rose_kill_by_device() warn: was negative '-ENETUNREACH' intended?
> net/rose/rose_in.c:58 rose_state1_machine() warn: was negative '-ECONNREFUSED' intended?
> net/rose/rose_timer.c:175 rose_timer_expiry() warn: was negative '-ETIMEDOUT' intended?
> net/rxrpc/peer_event.c:188 rxrpc_store_error() warn: was negative '-EACCES' intended?
> net/rxrpc/peer_event.c:189 rxrpc_store_error() warn: was negative '-EHOSTUNREACH' intended?
> net/sctp/input.c:557 sctp_v4_err_handle() warn: was negative '-EPROTO' intended?
> net/sctp/input.c:576 sctp_v4_err_handle() warn: was negative '-EHOSTUNREACH' intended?
> net/sctp/sm_statefuns.c:1050 sctp_sf_sendbeat_8_3() warn: was negative '-ETIMEDOUT' intended?
> net/sctp/sm_statefuns.c:1098 sctp_sf_send_reconf() warn: was negative '-ETIMEDOUT' intended?
> net/sctp/sm_statefuns.c:1841 sctp_sf_do_assoc_update() warn: was negative '-ECONNABORTED' intended?
> net/sctp/sm_statefuns.c:2535 sctp_sf_do_5_2_6_stale() warn: was negative '-ETIMEDOUT' intended?
> net/sctp/sm_statefuns.c:2699 __sctp_sf_do_9_1_abort() warn: was negative '-ECONNRESET' intended?
> net/sctp/sm_statefuns.c:2746 sctp_sf_cookie_wait_abort() warn: was negative '-ECONNREFUSED' intended?
> net/sctp/sm_statefuns.c:2762 sctp_sf_cookie_wait_icmp_abort() warn: was negative '-ENOPROTOOPT' intended?
> net/sctp/sm_statefuns.c:4075 sctp_sf_do_asconf_ack() warn: was negative '-ECONNABORTED' intended?
> net/sctp/sm_statefuns.c:4105 sctp_sf_do_asconf_ack() warn: was negative '-ECONNABORTED' intended?
> net/sctp/sm_statefuns.c:4749 sctp_sf_abort_violation() warn: was negative '-ECONNREFUSED' intended?
> net/sctp/sm_statefuns.c:4754 sctp_sf_abort_violation() warn: was negative '-ECONNABORTED' intended?
> net/sctp/sm_statefuns.c:4853 sctp_sf_violation_paramlen() warn: was negative '-ECONNABORTED' intended?
> net/sctp/sm_statefuns.c:5199 sctp_sf_do_9_1_prm_abort() warn: was negative '-ECONNABORTED' intended?
> net/sctp/sm_statefuns.c:5342 sctp_sf_cookie_wait_prm_abort() warn: was negative '-ECONNREFUSED' intended?
> net/sctp/sm_statefuns.c:5807 sctp_sf_do_6_3_3_rtx() warn: was negative '-ETIMEDOUT' intended?
> net/sctp/sm_statefuns.c:590 sctp_sf_do_5_1C_ack() warn: was negative '-ECONNREFUSED' intended?
> net/sctp/sm_statefuns.c:5936 sctp_sf_t1_init_timer_expire() warn: was negative '-ETIMEDOUT' intended?
> net/sctp/sm_statefuns.c:5993 sctp_sf_t1_cookie_timer_expire() warn: was negative '-ETIMEDOUT' intended?
> net/sctp/sm_statefuns.c:6033 sctp_sf_t2_timer_expire() warn: was negative '-ETIMEDOUT' intended?
> net/sctp/sm_statefuns.c:6119 sctp_sf_t4_timer_expire() warn: was negative '-ETIMEDOUT' intended?
> net/sctp/sm_statefuns.c:6178 sctp_sf_t5_timer_expire() warn: was negative '-ETIMEDOUT' intended?
> net/sctp/sm_statefuns.c:6615 sctp_eat_data() warn: was negative '-ECONNABORTED' intended?
> net/smc/af_smc.c:1497 __smc_connect() warn: was negative '-ETIMEDOUT' intended?
> net/smc/af_smc.c:1558 smc_connect_work() warn: was negative '-EPIPE' intended?
> net/smc/af_smc.c:1560 smc_connect_work() warn: was negative '-ECONNREFUSED' intended?
> net/smc/af_smc.c:1675 smc_clcsock_accept() warn: was negative '-ENOMEM' intended?
> net/smc/af_smc.c:327 smc_release() warn: was negative '-ECONNABORTED' intended?
> net/smc/smc_cdc.c:381 smc_cdc_msg_recv_action() warn: was negative '-ECONNRESET' intended?
> net/smc/smc_clc.c:681 smc_clc_wait_msg() warn: was negative '-EINTR' intended?
> net/smc/smc_clc.c:682 smc_clc_wait_msg() warn: was negative '-EINTR' intended?
> net/smc/smc_clc.c:687 smc_clc_wait_msg() warn: was negative '-EAGAIN' intended?
> net/smc/smc_clc.c:695 smc_clc_wait_msg() warn: was negative '-ECONNRESET' intended?
> net/smc/smc_clc.c:710 smc_clc_wait_msg() warn: was negative '-EPROTO' intended?
> net/smc/smc_clc.c:727 smc_clc_wait_msg() warn: was negative '-EPROTO' intended?
> net/smc/smc_close.c:133 smc_close_active_abort() warn: was negative '-ECONNABORTED' intended?
> net/smc/smc_close.c:135 smc_close_active_abort() warn: was negative '-ECONNABORTED' intended?
> net/smc/smc_core.c:1425 smc_conn_kill() warn: was negative '-ECONNABORTED' intended?
> net/smc/smc_tx.c:582 smcr_tx_sndbuf_nonempty() warn: was negative '-ECONNABORTED' intended?
> net/tipc/socket.c:2286 tipc_sk_filter_connect() warn: was negative '-ECONNREFUSED' intended?
> net/tipc/socket.c:2841 tipc_sk_check_probing_state() warn: was negative '-ECONNABORTED' intended?
> net/tls/tls_sw.c:818 bpf_exec_tx_verdict() warn: was negative '-EBADMSG' intended?
> net/tls/tls_sw.c:847 bpf_exec_tx_verdict() warn: was negative '-EBADMSG' intended?
> net/vmw_vsock/af_vsock.c:1300 vsock_connect_timeout() warn: was negative '-ETIMEDOUT' intended?
> net/vmw_vsock/virtio_transport.c:331 virtio_vsock_reset_sock() warn: was negative '-ECONNRESET' intended?
> net/vmw_vsock/virtio_transport_common.c:1041 virtio_transport_recv_connecting() warn: was negative '-ECONNRESET' intended?
> net/vmw_vsock/virtio_transport_common.c:1045 virtio_transport_recv_connecting() warn: was negative '-EPROTO' intended?
> net/vmw_vsock/vmci_transport.c:1150 vmci_transport_recv_connecting_server() warn: was negative '-EPROTO' intended?
> net/vmw_vsock/vmci_transport.c:1158 vmci_transport_recv_connecting_server() warn: was negative '-EPROTO' intended?
> net/vmw_vsock/vmci_transport.c:1291 vmci_transport_recv_connecting_client() warn: was negative '-EPROTO' intended?
> net/vmw_vsock/vmci_transport.c:1317 vmci_transport_recv_connecting_client() warn: was negative '-EPROTO' intended?
> net/vmw_vsock/vmci_transport.c:1351 vmci_transport_recv_connecting_client() warn: was negative '-ECONNRESET' intended?
> net/vmw_vsock/vmci_transport.c:1359 vmci_transport_recv_connecting_client() warn: was negative '-EPROTO' intended?
> net/vmw_vsock/vmci_transport.c:835 vmci_transport_handle_detach() warn: was negative '-ECONNRESET' intended?
> net/x25/af_x25.c:1782 x25_kill_by_neigh() warn: was negative '-ENETUNREACH' intended?
> net/x25/x25_in.c:146 x25_state1_machine() warn: was negative '-EISCONN' intended?
> net/x25/x25_in.c:154 x25_state1_machine() warn: was negative '-ECONNREFUSED' intended?
> net/x25/x25_timer.c:152 x25_do_timer_expiry() warn: was negative '-ETIMEDOUT' intended?
> net/xdp/xsk.c:1351 xsk_notifier() warn: was negative '-ENETDOWN' intended?
> security/keys/keyctl.c:1343 keyctl_reject_key() warn: was negative '-ERESTARTSYS' intended?
> security/keys/keyctl.c:1344 keyctl_reject_key() warn: was negative '-ERESTARTNOINTR' intended?
> security/keys/keyctl.c:1345 keyctl_reject_key() warn: was negative '-ERESTARTNOHAND' intended?
> security/keys/keyctl.c:1346 keyctl_reject_key() warn: was negative '-ERESTART_RESTARTBLOCK' intended?

